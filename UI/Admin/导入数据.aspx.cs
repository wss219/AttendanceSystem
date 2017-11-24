using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using BLL;
using System.Text;
using DAL;//为了方便  直接调用的DAL层  因为还要ddl的name，有些麻烦
using System.Security.Cryptography;

public partial class Admin_导入数据 : System.Web.UI.Page
{
    string KuoZhanName="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Role"].ToString() == "系统管理员")
            {
                Clear();
                ddlDepartmentName.Items.Add("");
                ddlDepartmentName.Items.Add("教务处");
                ddlDepartmentName.Items.Add("会计系");
                ddlDepartmentName.Items.Add("机械工程系");
                ddlDepartmentName.Items.Add("基础教学部");
                ddlDepartmentName.Items.Add("建筑工程系");
                ddlDepartmentName.Items.Add("经济管理系");
                ddlDepartmentName.Items.Add("商务外语系");
                ddlDepartmentName.Items.Add("食品工程系");
                ddlDepartmentName.Items.Add("信息工程系");      
            }
            else
            {
                Response.Redirect("~\\登录.aspx");
            }
        }    
    }
    protected void btnImportTeachers_Click(object sender, EventArgs e)//导入教师基本信息按钮
    {
        if (rdoOthers.Checked == false && rdoTeachers.Checked == false)//选择教师类型
        {
            lblMessage1.Text = "请先选择导入的数据是“本校教师”或者“外聘教师”";
        }
        else//选择完了教师类型
        {
            if (fileexcel.HasFile == true)//有文件
            {
                this.KuoZhanName = fileexcel.PostedFile.FileName.Substring(fileexcel.PostedFile.FileName.LastIndexOf(".") + 1);//扩展名
                if (KuoZhanName == "xls" || KuoZhanName == "xlsx")
                {
                    if (rdoTeachers.Checked)//本校教师单选
                    {
                        string name = UpLoad("Teachers\\SchoolTeachers", fileexcel);
                    }
                    else//外聘教师单选
                    {
                        string name = UpLoad("Teachers\\OtherTeachers", fileexcel);
                    }

                    lblMessage1.Text = "上传成功！";
                }
                else
                {
                    lblMessage1.Text = "只能上传Excel文件！";
                }
            }
            else
            {
                lblMessage1.Text = "文件不能为空!";
            }
        }      
    }
    protected void btnImportCourse_Click(object sender, EventArgs e)
    {
        Clear();
        string department = "";//和表名称是一致的
        department = ddlDepartmentName.SelectedItem.ToString();
        if (department == "" || department == null)
        {
            lblMessage2.Text = "部门不能为空！";
        }
        else
        {
            if (filecourse.HasFile == true)
            {
                this.KuoZhanName = filecourse.PostedFile.FileName.Substring(filecourse.PostedFile.FileName.LastIndexOf(".") + 1);//扩展名
                if (KuoZhanName == "xls" || KuoZhanName == "xlsx")
                {
                    //lblMessage2.Text = ExcelToDatabase.CheckFile(filecourse.FileName.ToString(),department);   课本上的
                    string FinalPathAndName = UpLoad("TeacherInfo\\", filecourse);//传到服务器上
                    DBHelper.SQLBulkCopy(InsertToSQLServer(FinalPathAndName, department), department);//参数获得表然后用BulkCopy直接导入到数据库
                    lblMessage2.Text = "导入SQLServer数据库成功!";
                }
                else
                {
                    lblMessage2.Text = "只能上传Excel文件！";
                }
            }
            else
            {
                lblMessage2.Text = "请先选择Excel文件！";
            }
        }
    }

    protected void ddlDepartmentName_SelectedIndexChanged(object sender, EventArgs e)
    {
        Clear();
    }


    protected void rdo_CheckedChanged(object sender,EventArgs e)
    {
        Clear();
    }

    private void Clear()
    {
        lblMessage1.Text = "";
        lblMessage2.Text = "";
        lblMessage3.Text = "";
        lblMessage4.Text = "";
        lblMessage5.Text = "";
        lblMessage7.Text = "";
    }

    private string UpLoad(string file_path,FileUpload fileUploadName)//先上传到服务器指定的文件夹下
    {
        HttpPostedFile file = fileUploadName.PostedFile;
        string fileName = file.FileName;
        //string tempPath = Server.MapPath(".")+"\\Teachers\\"+file_path+"\\";  //放到文件夹里
        string tempPath = Server.MapPath(".")+"\\"+ file_path +"\\";
        fileName = System.IO.Path.GetFileName(fileName);//不带路径的文件名
        string FinalPathAndName = tempPath + fileName;//最终的路径加名字
        file.SaveAs(FinalPathAndName);
        return FinalPathAndName;//返回最终的路径加文件名     
    }

    private DataTable InsertToSQLServer(string PathAndName,string BiaoMing)//文件路径+名称   Excel表的Sheet
    {
        string strConn = "provider=microsoft.ace.oledb.12.0;data source=" + PathAndName + ";extended properties='excel 8.0;HDR=YES;IMEX=1;';";
        OleDbConnection conn = new OleDbConnection(strConn);
        conn.Open();

        string strSQL = "select * from ["+BiaoMing+"$]";
        OleDbDataAdapter da = new OleDbDataAdapter(strSQL, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);//表在dt里了
        conn.Close();

        return dt;
    }

    protected void Button2_Click(object sender, EventArgs e)//分析入库信息，给密码加密
    {
        DataTable dt = AddSQLStringToDAL.GetDataTableBysql("select * from TabTeachers where UserID = UserPWD");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string pwd=dt.Rows[i]["UserPWD"].ToString();
                AddSQLStringToDAL.Update("update TabTeachers set UserPWD = '" + FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "MD5").ToString() + "'where UserPWD = '"+pwd+"'");
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)//处理入库数据
    {

    }
    protected void Button4_Click(object sender, EventArgs e)//清空入库数据
    {

    }
    protected void Button1_Click(object sender, EventArgs e)//校历导入
    {
        if (FileUpload1.HasFile == true)
        {
            this.KuoZhanName = FileUpload1.PostedFile.FileName.Substring(FileUpload1.PostedFile.FileName.LastIndexOf(".") + 1);//扩展名
            if (KuoZhanName == "xls" || KuoZhanName == "xlsx")
            {
                string Final = UpLoad("校历", FileUpload1);//上传到服务器的校历文件夹下
                DataTable dt = InsertToSQLServer(Final, "Sheet1");//最终的名字+Sheet
                DBHelper.SQLBulkCopyXiaoLi(dt, "校历");//插入到SQLServer表里
                lblMessage5.Text = "导入校历成功！";
                lblMessage5.Visible = true;
            }
            else
            {
                lblMessage5.Text = "请选择正确的Excel文件！";
                lblMessage5.Visible = true;
            }
        }
        else
        {
            lblMessage5.Text = "请先选择Excel文件！";
            lblMessage5.Visible = true;
        }
    }
}