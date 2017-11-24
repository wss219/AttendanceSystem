<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="修改密码.aspx.cs" Inherits="Admin_修改密码" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <table style="margin:auto">
        <tr>
            <th>工号:</th>
            <th>
                <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
            </th>
        </tr>

        <tr>
            <th>姓名:</th>
            <th>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </th>
        </tr>

        <tr>
            <th>密码:</th>
            <th>
                <asp:TextBox ID="txtUserPWD" runat="server" TextMode="Password"></asp:TextBox>
            </th>
        </tr>

        <tr>
            <th>确认密码:</th>
            <th>
                <asp:TextBox ID="txtUserEnterPWD" runat="server" TextMode="Password"></asp:TextBox>
            </th>
        </tr>

        <tr>
            <th colspan="2">
                <asp:Button ID="btnOK" runat="server" onclick="btnOK_Click" Text="确定" />
            </th>
        </tr>

        <tr>
            <th colspan="2"><asp:Label id="lblMessage" runat="server"></asp:Label></th>
        </tr>
    </table>
</div>
</asp:Content>

