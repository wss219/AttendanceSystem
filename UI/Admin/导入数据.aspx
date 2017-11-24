<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="导入数据.aspx.cs" Inherits="Admin_导入数据" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style type="text/css">
#table
{
    border-collapse:collapse;
    margin:0 auto;
    width:100%;
    height:100%;
    text-align:center;
    font-size:18px;
    font-weight:bold;
    background-color:rgba(400,200,180,0.1);
    }
table tr,table tr td
{
    margin:2px 2px 2px 2px;
    }
table tr td
{
    border:1px solid gray; 
    }
.trbgcolor
{
   background-color:#424a5d; font-size:20px; font-weight:bold; height:20px; color:White;
    }

#rdoOthers{
    margin-left:200px;
    }
.tableleft
{
    text-align:right;
    padding-right:30px;
    width:550px;
    }
.tablebtn
{    
    border:0px;
    width:550px;
    text-align:left;
    padding-left:30px;
    }
.btndaoru
{
    background-color:#993365;
    border:0px;
    border-radius:6px;
    width:100px;
    height:30px;
    color:White;
    font-size:16px;
    }
.btndaoru:hover
{
    cursor:pointer;
    background-color:#cd8cac;
    }
.btndata
{
    text-align:right;
    padding-right:30px;
    }
.marginleft
{
    background-color:#3598dc;
    border:0px;
    color:White;
    border-radius:6px;
    height:30px;
    font-size:16px;
    }
.marginleft:hover
{
    cursor:pointer;
    background-color:#6cb0df;
    }
</style>
    <table id="table">
    <tr>
        <td colspan="3" class="trbgcolor" >导入教师信息</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:RadioButton ID="rdoTeachers" runat="server" GroupName="rdo" Text="本校教师"/>
            <asp:RadioButton ID="rdoOthers" runat="server" GroupName="rdo" Text="外聘教师"/>
        </td>
    </tr>
    <tr>
        <td class="tableleft">请选择要导入的文件：</td>
        <td class="tableright"><asp:FileUpload ID="fileexcel" runat="server" /></td>
        <td class="tablebtn"><asp:Button ID="btnImportTeachers" class="btndaoru" runat="server" Text="导入" onclick="btnImportTeachers_Click" /></td>
    </tr>
    <tr>
        <td colspan="3"><asp:Label ID="lblMessage1" runat="server" Text="lblMessage1"></asp:Label></td>
    </tr>

    <tr>
        <td colspan="3" class="trbgcolor">分系部导入教师授课信息</td>
    </tr>
    <tr>
        <td colspan="3"><span>请选择部门：</span><asp:DropDownList ID="ddlDepartmentName" runat="server" onselectedindexchanged="ddlDepartmentName_SelectedIndexChanged"></asp:DropDownList></td>
    </tr>
    <tr>
        <td class="tableleft">请选择要导入的文件：</td>
        <td class="tableright"><asp:FileUpload ID="filecourse" runat="server" /></td>
        <td class="tablebtn"><asp:Button ID="btnImportCourse" class="btndaoru" runat="server" onclick="btnImportCourse_Click" Text="导入" /></td>
    </tr>
    <tr>
        <td colspan="3"><asp:Label ID="lblMessage2" runat="server" Text="lblMessage2"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3" class="trbgcolor">导入本学期校历</td>
    </tr>
    <tr>
        <td class="tableleft">请选择要导入的文件：</td>
        <td class="tableright"><asp:FileUpload ID="FileUpload1" runat="server" /></td>
        <td class="tablebtn"><asp:Button ID="Button1" class="btndaoru" runat="server" Text="导入" 
                onclick="Button1_Click" /></td>
    </tr>
    <tr>
        <td colspan="3"><asp:Label ID="lblMessage5" runat="server" Text="lblMessage5"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3" class="trbgcolor">导入各系部总人数</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:TextBox ID="TextBox1" class="left" runat="server" Width="60px"></asp:TextBox>会计系
            <asp:TextBox ID="TextBox2" runat="server" Width="60px"></asp:TextBox>信息工程系
            <asp:TextBox ID="TextBox3" runat="server" Width="60px"></asp:TextBox>经济管理系
            <asp:TextBox ID="TextBox4" runat="server" Width="60px"></asp:TextBox>食品工程系
            <asp:TextBox ID="TextBox5" runat="server" Width="60px"></asp:TextBox>机械工程系
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="label6" runat="server" Text="label6"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" class="trbgcolor">数据预处理</td>
    </tr>
    <tr>
        <td class="btndata">
            <asp:Button ID="Button2" class="marginleft" runat="server" Text="分析入库信息" 
                Width="215px" onclick="Button2_Click" />
        </td>
        <td colspan="2">
            <asp:Label ID="lblMessage3" runat="server" Text="lblMessage3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="btndata">
            <asp:Button ID="Button3" class="marginleft" runat="server" Text="处理入库数据" 
                Width="215px" onclick="Button3_Click"/>
        </td>
        <td colspan="2">
            <asp:Label ID="lblMessage7" runat="server" Text="lblMessage7"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="btndata">
            <asp:Button ID="Button4" class="marginleft" runat="server" Text="清空入库数据" 
                Width="215px" onclick="Button4_Click"/>
        </td>
        <td colspan="2">
            <asp:Label ID="lblMessage4" runat="server" Text="lblMessage4"></asp:Label>
        </td>
    </tr>
   </table>
</asp:Content>