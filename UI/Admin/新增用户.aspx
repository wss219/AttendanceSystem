<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="新增用户.aspx.cs" Inherits="Admin_AddNewTeacher" Debug="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="margin:0 auto">   <!--div内 表格居中-->

    <tr>
        <th colspan="2">
            &nbsp;</th>
    </tr>

    <tr>
    <th>教师类型:</th>
    <th>
        <asp:DropDownList ID="ddlTeachersType" runat="server" Height="20px" Width="192px" >
        </asp:DropDownList>
    </th>
    </tr>

    <tr>
    <th>所属部门:</th>
    <th>
        <asp:DropDownList ID="ddlDepartment" runat="server" Height="20px" Width="192px">
        </asp:DropDownList>
    </th>
    </tr>

    <tr>
    <th>教师工号:</th>   
    <th>
        <asp:TextBox ID="txtUserID" runat="server" Width="192px"></asp:TextBox>
        </th>
    </tr>
    
    <tr>
    <th>教师姓名:</th>   
    <th>
        <asp:TextBox ID="txtUserName" runat="server" Width="192px"></asp:TextBox>
        </th>
    </tr>
    
    <tr>
    <th>密码:</th>
    <th>
        <asp:TextBox ID="txtUserPWD" runat="server" TextMode="Password" Width="192px"></asp:TextBox>
        </th>
    </tr>
    
    <tr>
    <th>权限:</th>
    <th>
    	
        <asp:DropDownList ID="ddlRole" runat="server" Height="20px" Width="192px">
        </asp:DropDownList>
    	
    </th>
    </tr>

	<tr>
    <th></th>
    <th><asp:Button ID="btnEnter" runat="server"  Text="确定" onclick="btnEnter_Click" /></th>
    </tr>
    
    <tr>
    <th></th>
    <th><asp:Button ID="btnCancel" runat="server"  Text="取消" 
            onclick="btnCancel_Click1" /></th>
    </tr>
    

	<tr>
    <th colspan="2"><asp:Label id="lblMessage" runat="server"></asp:Label></th>
    </tr>

    <tr>
    <th colspan="2">
        &nbsp;</th>
    </tr>
    
    </table>
</asp:Content>

