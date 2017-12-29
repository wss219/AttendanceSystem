using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

public partial class Admin_导出数据 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Role"].ToString() != "系统管理员")
            {
                Response.Redirect("~\\登录.aspx");
            }
            else
            {
                Label1.Visible = false;//多出来的没用
                Teacherlbl.Visible = false;
                gvTeacher.Visible = false;
                btnTeacher.Visible = false;
                btnStudent.Visible = false;
                lblStudent.Visible = false;
                gvStudent.Visible = false;
                DataTable dt = GetTeacherDt();
                if (dt.Rows.Count == 0)
                {
                    Teacherlbl.Visible = true;
                }
                else
                {
                    gvTeacher.Visible = true;
                    btnTeacher.Visible = true;
                }

                DataTable dt1 = GetStudentDt();
                if (dt1.Rows.Count == 0)
                {
                    lblStudent.Visible = true;
                }
                else
                {
                    btnStudent.Visible = true;
                    gvStudent.Visible = true;
                }
            }
        }
    }

    private DataTable GetTeacherDt()
    {
        DataTable dt = AddSQLStringToDAL.GetDataTableBysql("select * from TabTeacherAttendance where [IsAttendance] = '未考勤'");
        return dt;
    }

    private DataTable GetStudentDt()
    {
        DataTable dt = AddSQLStringToDAL.GetDataTableBysql("SELECT [TeacherID],[TeacherName],[Course],[CurrentWeek],[Week],[Time],[StudentDepartment],[StudentClass],[StudentID],[StudentName],[AttendanceType] FROM [TabStudentAttendance]");
        return dt;
    }

    protected void btnTeacher_Click(object sender, EventArgs e)
    {
        CreateExcel(GetTeacherDt(), "application/ms-excel", "教师漏报信息");
    }

    public void CreateExcel(DataTable dt, string FileType, string FileName)
    {
        Response.Clear();
        Response.Charset = "UTF-8";
        Response.Buffer = true;
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.AppendHeader("Content-Disposition", "attachment;filename=\"" + System.Web.HttpUtility.UrlEncode(FileName, System.Text.Encoding.UTF8) + ".xls\"");
        Response.ContentType = FileType;
        string colHeaders = string.Empty;
        string ls_item = string.Empty;
        DataRow[] myRow = dt.Select();
        int i = 0;
        int cl = dt.Columns.Count;
        foreach (DataRow row in myRow)
        {
            for (i = 0; i < cl; i++)
            {
                if (i == (cl - 1))
                {
                    ls_item += row[i].ToString() + "\n";
                }
                else
                {
                    ls_item += row[i].ToString() + "\t";
                }
            }
            Response.Output.Write(ls_item);
            ls_item = string.Empty;
        }
        Response.Output.Flush();
        Response.End();
    }
    protected void btnStudent_Click(object sender, EventArgs e)
    {
        CreateExcel( GetStudentDt() , "application/ms-excel", "学生缺勤信息");
    }
}