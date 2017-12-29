<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="导出数据.aspx.cs" Inherits="Admin_导出数据" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblTeacher" runat="server" Text="教师漏报信息" BackColor="White" Font-Size="12px"></asp:Label>

    <asp:Button ID="btnTeacher" runat="server" Text="下载导出数据" onclick="btnTeacher_Click"/>
    <br />
    <asp:Label ID="Teacherlbl" runat="server" Text="暂无教师漏报信息！"></asp:Label>

    <div style="overflow-y: scroll; height: 350px">   <!-- 控制滚动条的 -->
    <asp:GridView ID="gvTeacher" runat="server" AutoGenerateColumns="False" 
        DataSourceID="Teachers">
        <Columns>
            <asp:BoundField DataField="TeacherDepartment" HeaderText="TeacherDepartment" 
                SortExpression="TeacherDepartment" />
            <asp:BoundField DataField="TeacherID" HeaderText="TeacherID" 
                SortExpression="TeacherID" />
            <asp:BoundField DataField="TeacherName" HeaderText="TeacherName" 
                SortExpression="TeacherName" />
            <asp:BoundField DataField="CurrentWeek" HeaderText="CurrentWeek" 
                SortExpression="CurrentWeek" />
            <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
            <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
            <asp:BoundField DataField="Course" HeaderText="Course" 
                SortExpression="Course" />
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
            <asp:BoundField DataField="IsAttendance" HeaderText="IsAttendance" 
                SortExpression="IsAttendance" />
            <asp:BoundField DataField="Count" HeaderText="Count" SortExpression="Count" />
            <asp:BoundField DataField="StudentIDList" HeaderText="StudentIDList" 
                SortExpression="StudentIDList" />
        </Columns>
    </asp:GridView>
    </div>

    <asp:SqlDataSource ID="Teachers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select 
       [TeacherDepartment]
      ,[TeacherID]
      ,[TeacherName]
      ,[CurrentWeek]
      ,[Week]
      ,[Time]
      ,[Course]
      ,[Area]
      ,[IsAttendance]
      ,[Count]
      ,[StudentIDList]
     from [TabTeacherAttendance] where [IsAttendance] = '未考勤'"></asp:SqlDataSource>
    <br />


    <asp:Label ID="Students" runat="server" Text="学生缺勤信息"></asp:Label>
    <asp:Button ID="btnStudent" runat="server" Text="下载导出数据" 
        onclick="btnStudent_Click" />  
    <br />
    <asp:Label ID="lblStudent" runat="server" Text="暂无学生缺勤信息！"></asp:Label>

    <div style="overflow-y: scroll; height: 350px">   <!-- 控制滚动条的 -->
    <asp:GridView ID="gvStudent" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SQLStudents">
        <Columns>
            <asp:BoundField DataField="TeacherID" HeaderText="TeacherID" 
                SortExpression="TeacherID" />
            <asp:BoundField DataField="TeacherName" HeaderText="TeacherName" 
                SortExpression="TeacherName" />
            <asp:BoundField DataField="Course" HeaderText="Course" 
                SortExpression="Course" />
            <asp:BoundField DataField="CurrentWeek" HeaderText="CurrentWeek" 
                SortExpression="CurrentWeek" />
            <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
            <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
            <asp:BoundField DataField="StudentDepartment" HeaderText="StudentDepartment" 
                SortExpression="StudentDepartment" />
            <asp:BoundField DataField="StudentClass" HeaderText="StudentClass" 
                SortExpression="StudentClass" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" 
                SortExpression="StudentID" />
            <asp:BoundField DataField="StudentName" HeaderText="StudentName" 
                SortExpression="StudentName" />
            <asp:BoundField DataField="AttendanceType" HeaderText="AttendanceType" 
                SortExpression="AttendanceType" />
        </Columns>
    </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SQLStudents" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 
       [TeacherID]
      ,[TeacherName]
      ,[Course]
      ,[CurrentWeek]
      ,[Week]
      ,[Time]
      ,[StudentDepartment]
      ,[StudentClass]
      ,[StudentID]
      ,[StudentName]
      ,[AttendanceType]
  FROM [TabStudentAttendance]"></asp:SqlDataSource>

</asp:Content>

