using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

public partial class Admin_用户管理 : System.Web.UI.Page
{
    string GongHao = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"].ToString() != "系统管理员")
        {
            Response.Redirect("~\\登录.aspx");
        }
    }
    protected void Rightbtn2_Click(object sender, EventArgs e)//单击删除按钮
    {
        //获取选中行的UserID就可以
        //根据索引查询并记录UserID
        //Rightbtn4.Text = GongHao;

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor=e;");//光标移除时
            e.Row.Attributes.Add("OnMouseOver", "e=this.style.backgroundColor;this.style.backgroundColor='#5CCCCC'");//光标移到时
            //e.Row.Attributes.Add("OnClick", "e=this.style.backgroundColor='#FFC125';this.GridView1.SelectedIndex = e.Row.RowIndex");//单击的行变色
            e.Row.Attributes["style"] = "Cursor.hand";//变成小手形状
            //lab1.Text = this.GridView1.SelectedIndex.ToString();
        } 
    }
}