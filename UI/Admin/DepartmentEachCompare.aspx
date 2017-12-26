<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DepartmentEachCompare.aspx.cs" Inherits="Admin_DepartmentEachCompare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
    <tr>
        <td></td>
        <td colspan="6">各系汇总对比</td>
        <td colspan="2"><asp:Button ID="button1" Text="查看各系详单" runat="server" /></td>
    </tr>

    <tr>
        <td></td>
        <td></td>
        <td colspan="4"><asp:CheckBox ID="checkbox1" runat="server" Text="按周次检索" /><asp:DropDownList ID="DDL1" runat="server"></asp:DropDownList></td>
    </tr>

    <tr>
        <td></td>
        <td><asp:RadioButton ID="thisWeek" Text="本周情况" runat="server" AutoPostBack="true" GroupName="rdoWeek" /></td>
        <td><asp:RadioButton ID="lastWeek" Text="上周情况" runat="server" AutoPostBack="true" GroupName="rdoWeek" /></td>
        <td><asp:RadioButton ID="aMouseWeek" Text="近一个月情况" runat="server" AutoPostBack="true" GroupName="rdoWeek" /></td>
        <td><asp:RadioButton ID="ToThisWeek" Text="开学至今" runat="server" AutoPostBack="true" GroupName="rdoWeek" /></td>
        <td><asp:Button ID="CreatTable" runat="server" Text="生成图表" /></td>
    </tr>

    <tr>
        <td colspan="8"><asp:Label ID="lblMessage" runat="server" Text="lblMessage"></asp:Label></td>
    </tr>
</table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Font-Size="12px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:BoundField DataField="系部" HeaderText="系部">
            <ItemStyle Width="90px" />
            </asp:BoundField>
            <asp:BoundField DataField="在校生人数" HeaderText="在校生人数">
            <ItemStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField DataField="旷课人次" HeaderText="旷课人次">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="旷课率" HeaderText="旷课率">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="迟到人次" HeaderText="迟到人次">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="迟到率" HeaderText="迟到率">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="早退人次" HeaderText="早退人次">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="早退率" HeaderText="早退率">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="请假人次" HeaderText="请假人次">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="请假率" HeaderText="请假率">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="总缺勤数" HeaderText="总缺勤数">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="总缺勤率" HeaderText="总缺勤率">
            <ItemStyle Width="60px" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <HeaderStyle BackColor="#2DE0EB" Font-Bold="True" ForeColor="White" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    </asp:GridView>

    <div style="overflow-y: scroll; height: 600px">   <!-- 控制滚动条的 -->
    <tr>
        <td style="width:100%;height:350px" align="center">
            <asp:PlaceHolder ID="phDepartmentEachCompare" runat="server"></asp:PlaceHolder>
        <br />
        </td>
    </tr>

    <tr>
        <td style="width:100%;height:350px" align="center">
            <asp:PlaceHolder ID="phAttendance" runat="server"></asp:PlaceHolder>
        <br />
        </td>
    </tr>

    <tr>
        <td style="width:100%;height:350px" align="center">
            <asp:PlaceHolder ID="phLeave" runat="server"></asp:PlaceHolder>
        <br />
        </td>
    </tr>

    <tr>
        <td style="width:100%;height:350px" align="center">
            <asp:PlaceHolder ID="phLate" runat="server"></asp:PlaceHolder>
        </td>
    </tr>

    <tr>
        <td style="width:100%;height:350px" align="center">
            <br />
            <asp:PlaceHolder ID="phEarly" runat="server"></asp:PlaceHolder>
        </td>
    </tr>
    </div>
    
    
</asp:Content>

