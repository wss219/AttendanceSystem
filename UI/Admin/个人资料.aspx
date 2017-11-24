<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="个人资料.aspx.cs" Inherits="Admin_个人资料" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
 #personmain
 {
     width:100%;
     height:100%;
     margin:0 auto;
     background-color:#e6dbfb;
     font-size:20px;
     font-weight:bold;
     }
#perleft
{
    width:40%;
    float:left;
    text-align:center;
    margin-top:150px;
    border-right:1px solid purple;
   
    }
#perright
{
    float:left;
    height:200px;
    width:59%; 
    padding-top:110px;
    }
#headimg
{
    border-radius:50%;
    }
.headimg
{
    border-radius:50%;    
    box-shadow:0 0 2px 2px black;
    }
#div2,#div3
{
    margin-top:20px;
    }
.btnOK
{
    background-image:url(../loginimages/个人资料/button1.jpg);
    background-repeat:repeat-x;
    border-radius:20px;
    width:80px;
    height:30px;
    margin-right:50px;
    }
.btnCancel
{
    background-image:url(../loginimages/个人资料/button2.jpg);
    background-repeat:repeat-x;
    border-radius:20px;
    width:80px;
    height:30px;
    }
.fileupload
{
    margin-left:50px;
            margin-bottom: 0px;
        }
.divright
{
    width:500px;
    height:20px;
    text-align:center;
    margin-top:50px;
    }
.font
{
    width:500px;
    height:20px;
    line-height:2.0  
    }
.csslabel
{
    width:500px;
    height:20px;
    margin-top:-13px;
    margin-left:120px;
    }
</style>
<div id="personmain">
  <div id="perleft">
    <div id="headimg">
        <asp:ImageButton ID="btnImage" class="headimg" runat="server" onclick="ImageButton1_Click" 
         AlternateText="头像更换失败，请重新更换！" ToolTip="修改头像" Width="250px" Height="250px"/>
    </div>
    <div id="div2"><asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="None" 
            CssClass="fileupload" Font-Size="16px" ForeColor="White" onchange="uploadFile(this.value)"/>
            </div>
    <div id="div3"> 
        <asp:Button ID="btnOK" runat="server" Text="确定" onclick="btnOK_Click" 
            BorderStyle="None" CssClass="btnOK" Font-Bold="True" Font-Size="16px" 
            ForeColor="White" />
        <asp:Button ID="btnCancel" runat="server" Text="取消" BorderStyle="None" 
            CssClass="btnCancel" Font-Bold="True" Font-Size="16px" ForeColor="White" />
    </div>
    <div>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>
  </div>
  <div id="perright">
    <div class="divright">
        <div class="font">教师工号: </div>
        <div class="csslabel"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
    </div>
    <div class="divright">
        <div class="font">教师姓名：</div>
        <div class="csslabel"><asp:Label ID="label2" runat="server" Text="Label"></asp:Label></div>
    </div>
    <div class="divright">
        <div class="font">教师权限：</div>
        <div class="csslabel"><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></div>
    </div>
    <div class="divright">
        <div class="font">教师性别：</div>
        <div class="csslabel"><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></div>
    </div>
    <div class="divright">
        <div class="font">所属部门：</div>
        <div class="csslabel"><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></div>
    </div>
  </div>
</div>
</asp:Content>