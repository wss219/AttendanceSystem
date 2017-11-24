<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="用户管理.aspx.cs" Inherits="Admin_用户管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
    #GridView1
    {
        width:99%;
        height:99%;
        text-align:center;
        }
</style>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [TabTeachers] WHERE [UserID] = @UserID" 
        InsertCommand="INSERT INTO [TabTeachers] ([Type], [Department], [UserID], [UserName]) VALUES (@Type, @Department, @UserID, @UserName)" 
        SelectCommand="SELECT [Type], [Department], [UserID], [UserName] FROM [TabTeachers]" 
        UpdateCommand="UPDATE [TabTeachers] SET [Type] = @Type, [Department] = @Department, [UserName] = @UserName WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="UserID" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="UserID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="UserID" 
        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Height="99%" onrowdatabound="GridView1_RowDataBound" 
        PageSize="25" Width="100%" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Department" HeaderText="所属部门" 
                SortExpression="Department" />
            <asp:BoundField DataField="UserName" HeaderText="教师姓名" 
                SortExpression="UserName" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserID" HeaderText="教师工号" ReadOnly="True" 
                SortExpression="UserID" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Type" HeaderText="教师类型" SortExpression="Type" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="第一页" LastPageText="最后一页" 
            Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
            VerticalAlign="Middle" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

</asp:Content>

