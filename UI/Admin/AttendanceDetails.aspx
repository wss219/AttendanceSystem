<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AttendanceDetails.aspx.cs" Inherits="Admin_AttendanceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br /><!--没用  你们懂得！！！-->
    <asp:Label ID="lblAttendanceMessage" runat="server" Text="旷课名单："></asp:Label><br />
    <asp:Label ID="lblLateMessage" runat="server" Text="迟到名单："></asp:Label><br />
    <asp:Label ID="lblEarlyMessage" runat="server" Text="早退名单："></asp:Label><br />
    <asp:Label ID="lblLeaveMessage" runat="server" Text="请假名单："></asp:Label><br />
    <asp:Label ID="lblResultMessage" runat="server" Text="考勤情况"></asp:Label><br />
    <asp:Label ID="lblMessage" runat="server" Text="授课信息"></asp:Label><br />
    <asp:Button ID="btnClose" runat="server" Text="返回主页面" 
        onclick="btnClose_Click" />

    <asp:Button ID="btnAttdance" runat="server" Text="上报考勤结果" 
        onclick="btnAttdance_Click" />
    <asp:CheckBox ID="chkNormal" runat="server" Text="教学异动" />
    <asp:DropDownList ID="ddlUnNormal" runat="server"></asp:DropDownList>
    <asp:Button ID="btnUnNormal" runat="server" Text="确定" />

    <div style="overflow-y: scroll; height: 600px">   <!-- 控制滚动条的 -->
    <asp:GridView ID="gvAttendanceDetails" runat="server" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="StudentID"
                  DataSourceID="SqlDataSourceAttandanceDetails" 
        GridLines="Horizontal" OnRowDataBound="gvAttendanceDetails_RowDataBond" 
        Font-Size="12px" PageSize="20" Width="100%" Height="141%" 
            style="margin-bottom: 0px">
                  <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <Columns>
            <asp:BoundField HeaderText="所属系部" ItemStyle-Width="100px" 
                SortExpression="StudentDepartment" DataField="StudentDepartment" >
            <ItemStyle Width="100px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="班级" DataField="TimeAndArea" SortExpression="TimeAndArea" >
            <ItemStyle Width="100px" Wrap="False" />
            </asp:BoundField>
            <asp:BoundField HeaderText="学号" DataField="StudentID" ReadOnly="True" 
                SortExpression="StudentID" >
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="姓名" DataField="StudentName" 
                SortExpression="StudentName" >
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="出勤情况">
            <ItemTemplate>
            <asp:RadioButton ID="rdoNormal" runat="server" GroupName="g1" Text="正常" Checked="true" AutoPostBack="true" OnCheckedChanged="rdo_CheckChange" />
            <asp:RadioButton ID="rdoLate" runat="server" GroupName="g1" Text="迟到"  AutoPostBack="true" OnCheckedChanged="rdo_CheckChange" />
            <asp:RadioButton ID="rdoAbsence" runat="server" GroupName="g1" Text="旷课"  AutoPostBack="true" OnCheckedChanged="rdo_CheckChange" />
            <asp:RadioButton ID="rdoEarly" runat="server" GroupName="g1" Text="早退" AutoPostBack="true" OnCheckedChanged="rdo_CheckChange" />
            <asp:RadioButton ID="rdoLeave" runat="server" GroupName="g1" Text="请假" AutoPostBack="true" OnCheckedChanged="rdo_CheckChange" />
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <FooterStyle  BackColor="#B5C7DE" ForeColor="#4A3C8C"/>
                  <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" 
                      PreviousPageText="上一页" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="true" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="true" ForeColor="#F7F7F7" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
    </asp:GridView>
    </div>

    

    

    

    <asp:SqlDataSource ID="SqlDataSourceAttandanceDetails" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT DISTINCT [StudentDepartment],[StudentID],[StudentName],[TimeAndArea] FROM [TabAllCourses] WHERE (([TeacherID] = @TeacherID) AND ([Course] = @Course) AND ([TimeAndArea] = @TimeAndArea ))

">
    
    <SelectParameters>
    <asp:SessionParameter Name="TeacherID" SessionField="UserID" Type="String" />
    <asp:SessionParameter Name="Course" SessionField="CurrentCourse" Type="String" />
    <asp:SessionParameter Name="TimeAndArea" SessionField="WeekRange" Type="String" />
    </SelectParameters>

    </asp:SqlDataSource>
</asp:Content>

