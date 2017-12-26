using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Web.Security;//MD5加密要用到

public partial class Leader_修改密码 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Role"].ToString() != "")
            {
                txtUserID.Text = Session["UserID"].ToString();
                txtUserName.Text = Session["UserName"].ToString();
            }
            else
            {
                Response.Redirect("~\\登录.aspx");
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (txtUserPWD.Text == "")
        {
            txtUserEnterPWD.Text = "";
            lblMessage.Text = "修改失败！密码不能为空！";
        }
        else
        {
            if (txtUserPWD.Text != txtUserEnterPWD.Text)
            {
                txtUserPWD.Text = "";
                txtUserEnterPWD.Text = "";
                lblMessage.Text = "修改失败！两次密码不一致！";
            }
            else
            {
                AddSQLStringToDAL.Update("TabTeachers", "UserPWD", FormsAuthentication.HashPasswordForStoringInConfigFile(txtUserPWD.Text, "MD5").ToString(), "UserID", txtUserID.Text);
                lblMessage.Text = "修改成功!";
            }
        }
    }
}