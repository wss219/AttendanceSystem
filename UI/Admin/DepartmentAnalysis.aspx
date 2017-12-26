<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DepartmentAnalysis.aspx.cs" Inherits="Admin_DepartmentAnalysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css">
.btn-small,.btn-big
{
    border:0px;
    }
.btn-small
{
    width:40px;
    height:15px;
    margin:0 auto;
    border-radius:3px;
    background:#e9629a;
    color:White;
    cursor:pointer;
    }
.btn-small:hover
{
    background:#f37bad;
    }
.btn-big
{
    width:110px;
    height:33px;
    margin:0 auto;
    border-radius:5px;
    color:White;
    background:#5584f4;
    cursor:pointer;
    }
.btn-big:hover
{
    background:#6e95f2;
    }
</style>
    <table width="100%">
        <tr>
            <td>
                <asp:GridView ID="gvKJ" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    OnRowDataBound="gvKJ_RowDataBound" Font-Size="12px" style="margin-top: 0px" 
                    Width="100%">
                    <Columns>
                       <asp:BoundField HeaderText="周次" ItemStyle-Width="60px" DataField="周次" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="系部" ItemStyle-Width="80px" DataField="系部">
<ItemStyle Width="80px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="迟到人数" ItemStyle-Width="60px" DataField="迟到人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="早退人数" ItemStyle-Width="60px" DataField="早退人数">
                        <ItemStyle Width="60px" />
                        </asp:BoundField>
                       <asp:BoundField HeaderText="旷课人数" ItemStyle-Width="60px" DataField="旷课人数">
                        <ItemStyle Width="60px" />
                        </asp:BoundField>
                       <asp:BoundField HeaderText="请假人数" ItemStyle-Width="60px" DataField="请假人数">
                        <ItemStyle Width="60px" />
                        </asp:BoundField>
                       <asp:BoundField HeaderText="合计" ItemStyle-Width="60px" DataField="合计">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:TemplateField HeaderText="详情" ItemStyle-Width="60px" >
                       <ItemTemplate>
                            <asp:Button ID="btnDetail" CssClass="btn-small" runat="server" Text="详情" Font-Size="12px" OnClick="btnDetailsClick" />
                       </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
                       </asp:TemplateField>
                   </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="Tan" Font-Bold="true" />
                    <HeaderStyle BackColor="Tan" Font-Bold="true" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>


                <asp:PlaceHolder ID="phKJ" runat="server"></asp:PlaceHolder>
                <asp:Label ID="lblKJ" runat="server" Text="lblKJ" ForeColor="Red" Font-Size="12px"></asp:Label>
              </td>
              <td style="width:24%" align="center" valign="middle">
                <asp:Button ID="btnKJ" runat="server" CssClass="btn-big" Text="会计系图表分析" OnClick="btnKJClick" Font-Size="12px"/>
             </td>
         </tr>
        


         
        <tr>
            <td>
                <asp:GridView ID="gvXX" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    OnRowDataBound="gvXX_RowDataBound" Font-Size="12px" style="margin-top: 0px" 
                    Width="100%">
                    <Columns>
                       <asp:BoundField HeaderText="周次" ItemStyle-Width="60px" DataField="周次" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="系部" ItemStyle-Width="80px" DataField="系部">
<ItemStyle Width="80px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="迟到人数" ItemStyle-Width="60px" DataField="迟到人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="早退人数" ItemStyle-Width="60px" DataField="早退人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="旷课人数" ItemStyle-Width="60px" DataField="旷课人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="请假人数" ItemStyle-Width="60px" DataField="请假人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="合计" ItemStyle-Width="60px" DataField="合计">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:TemplateField HeaderText="详情" ItemStyle-Width="60px" >
                       <ItemTemplate>
                            <asp:Button ID="btnDetail" CssClass="btn-small" runat="server" Text="详情" Font-Size="12px" OnClick="btnDetailsClick" />
                       </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
                       </asp:TemplateField>
                   </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="Tan" Font-Bold="true" />
                    <HeaderStyle BackColor="Tan" Font-Bold="true" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:PlaceHolder ID="phXX" runat="server"></asp:PlaceHolder>
                <asp:Label ID="lblXX" runat="server" Text="lblXX" ForeColor="Red" Font-Size="12px"></asp:Label>
              </td>
              <td style="width:24%" align="center" valign="middle">
                <asp:Button ID="btnXX" runat="server" CssClass="btn-big" Text="信息系图表分析" OnClick="btnXXClick" Font-Size="12px"/>
             </td>
         </tr>

         <tr>
            <td>
                <asp:GridView ID="gvJG" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    OnRowDataBound="gvJG_RowDataBound" Font-Size="12px" style="margin-top: 0px" 
                    Width="100%">
                    <Columns>
                       <asp:BoundField HeaderText="周次" ItemStyle-Width="60px" DataField="周次" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="系部" ItemStyle-Width="80px" DataField="系部">
<ItemStyle Width="80px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="迟到人数" ItemStyle-Width="60px" DataField="迟到人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="早退人数" ItemStyle-Width="60px" DataField="早退人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="旷课人数" ItemStyle-Width="60px" DataField="旷课人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="请假人数" ItemStyle-Width="60px" DataField="请假人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="合计" ItemStyle-Width="60px" DataField="合计">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:TemplateField HeaderText="详情" ItemStyle-Width="60px" >
                       <ItemTemplate>
                            <asp:Button ID="btnDetail" CssClass="btn-small" runat="server" Text="详情" Font-Size="12px" OnClick="btnDetailsClick" />
                       </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
                       </asp:TemplateField>
                   </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="Tan" Font-Bold="true" />
                    <HeaderStyle BackColor="Tan" Font-Bold="true" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:PlaceHolder ID="phJG" runat="server"></asp:PlaceHolder>
                <asp:Label ID="lblJG" runat="server" Text="lblJG" ForeColor="Red" Font-Size="12px"></asp:Label>
              </td>
              <td style="width:24%" align="center" valign="middle">
                <asp:Button ID="btnJG" runat="server" CssClass="btn-big" Text="经管系图表分析" OnClick="btnJGClick" Font-Size="12px"/>
             </td>
         </tr>

         <tr>
            <td>
                <asp:GridView ID="gvSP" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    OnRowDataBound="gvSP_RowDataBound" Font-Size="12px" style="margin-top: 0px" 
                    Width="100%">
                    <Columns>
                       <asp:BoundField HeaderText="周次" ItemStyle-Width="60px" DataField="周次" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="系部" ItemStyle-Width="80px" DataField="系部">
<ItemStyle Width="80px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="迟到人数" ItemStyle-Width="60px" DataField="迟到人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="早退人数" ItemStyle-Width="60px" DataField="早退人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="旷课人数" ItemStyle-Width="60px" DataField="旷课人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="请假人数" ItemStyle-Width="60px" DataField="请假人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="合计" ItemStyle-Width="60px" DataField="合计">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:TemplateField HeaderText="详情" ItemStyle-Width="60px" >
                       <ItemTemplate>
                            <asp:Button ID="btnDetail" CssClass="btn-small" runat="server" Text="详情" Font-Size="12px" OnClick="btnDetailsClick" />
                       </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
                       </asp:TemplateField>
                   </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="Tan" Font-Bold="true" />
                    <HeaderStyle BackColor="Tan" Font-Bold="true" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:PlaceHolder ID="phSP" runat="server"></asp:PlaceHolder>
                <asp:Label ID="lblSP" runat="server" Text="lblSP" ForeColor="Red" Font-Size="12px"></asp:Label>
              </td>
              <td style="width:24%" align="center" valign="middle">
                <asp:Button ID="btnSP" runat="server" CssClass="btn-big" Text="食品系图表分析" OnClick="btnSPClick" Font-Size="12px"/>
             </td>
         </tr>

         <tr>
            <td>
                <asp:GridView ID="gvJX" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    OnRowDataBound="gvJX_RowDataBound" Font-Size="12px" style="margin-top: 0px" 
                    Width="100%">
                    <Columns>
                       <asp:BoundField HeaderText="周次" ItemStyle-Width="60px" DataField="周次" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="系部" ItemStyle-Width="80px" DataField="系部">
<ItemStyle Width="80px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="迟到人数" ItemStyle-Width="60px" DataField="迟到人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="早退人数" ItemStyle-Width="60px" DataField="早退人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="旷课人数" ItemStyle-Width="60px" DataField="旷课人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="请假人数" ItemStyle-Width="60px" DataField="请假人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="合计" ItemStyle-Width="60px" DataField="合计">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:TemplateField HeaderText="详情" ItemStyle-Width="60px" >
                       <ItemTemplate>
                            <asp:Button ID="btnDetail" CssClass="btn-small" runat="server" Text="详情" Font-Size="12px" OnClick="btnDetailsClick" />
                       </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
                       </asp:TemplateField>
                   </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="Tan" Font-Bold="true" />
                    <HeaderStyle BackColor="Tan" Font-Bold="true" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:PlaceHolder ID="phJX" runat="server"></asp:PlaceHolder>
                <asp:Label ID="lblJX" runat="server" Text="lblJX" ForeColor="Red" Font-Size="12px"></asp:Label>
              </td>
              <td style="width:24%" align="center" valign="middle">
                <asp:Button ID="btnJX" runat="server" CssClass="btn-big" Text="机械系图表分析" OnClick="btnJXClick" Font-Size="12px"/>
             </td>
         </tr>

         <tr>
            <td>
                <asp:GridView ID="gvWY" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    OnRowDataBound="gvWY_RowDataBound" Font-Size="12px" style="margin-top: 0px" 
                    Width="100%">
                    <Columns>
                       <asp:BoundField HeaderText="周次" ItemStyle-Width="60px" DataField="周次" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="系部" ItemStyle-Width="80px" DataField="系部">
<ItemStyle Width="80px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="迟到人数" ItemStyle-Width="60px" DataField="迟到人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="早退人数" ItemStyle-Width="60px" DataField="早退人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="旷课人数" ItemStyle-Width="60px" DataField="旷课人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="请假人数" ItemStyle-Width="60px" DataField="请假人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="合计" ItemStyle-Width="60px" DataField="合计">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:TemplateField HeaderText="详情" ItemStyle-Width="60px" >
                       <ItemTemplate>
                            <asp:Button ID="btnDetail" CssClass="btn-small" runat="server" Text="详情" Font-Size="12px" OnClick="btnDetailsClick" />
                       </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
                       </asp:TemplateField>
                   </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="Tan" Font-Bold="true" />
                    <HeaderStyle BackColor="Tan" Font-Bold="true" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:PlaceHolder ID="phWY" runat="server"></asp:PlaceHolder>
                <asp:Label ID="lblWY" runat="server" Text="lblWY" ForeColor="Red" Font-Size="12px"></asp:Label>
              </td>
              <td style="width:24%" align="center" valign="middle">
                <asp:Button ID="btnWY" runat="server" CssClass="btn-big" Text="外语系图表分析" OnClick="btnWYClick" Font-Size="12px"/>
             </td>
         </tr>

         <tr>
            <td>
                <asp:GridView ID="gvJZ" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    OnRowDataBound="gvJZ_RowDataBound" Font-Size="12px" style="margin-top: 0px" 
                    Width="100%">
                    <Columns>
                       <asp:BoundField HeaderText="周次" ItemStyle-Width="60px" DataField="周次" >
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="系部" ItemStyle-Width="80px" DataField="系部">
<ItemStyle Width="80px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="迟到人数" ItemStyle-Width="60px" DataField="迟到人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="早退人数" ItemStyle-Width="60px" DataField="早退人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="旷课人数" ItemStyle-Width="60px" DataField="旷课人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="请假人数" ItemStyle-Width="60px" DataField="请假人数">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:BoundField HeaderText="合计" ItemStyle-Width="60px" DataField="合计">
<ItemStyle Width="60px"></ItemStyle>
                        </asp:BoundField>
                       <asp:TemplateField HeaderText="详情" ItemStyle-Width="60px" >
                       <ItemTemplate>
                            <asp:Button ID="btnDetail" CssClass="btn-small" runat="server" Text="详情" Font-Size="12px" OnClick="btnDetailsClick" />
                       </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
                       </asp:TemplateField>
                   </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="Tan" Font-Bold="true" />
                    <HeaderStyle BackColor="Tan" Font-Bold="true" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:PlaceHolder ID="phJZ" runat="server"></asp:PlaceHolder>
                <asp:Label ID="lblJZ" runat="server" Text="lblJZ" ForeColor="Red" Font-Size="12px"></asp:Label>
              </td>
              <td style="width:24%" align="center" valign="middle">
                <asp:Button ID="btnJZ" runat="server" CssClass="btn-big" Text="建筑系图表分析" OnClick="btnJZClick" Font-Size="12px"/>
             </td>
         </tr>
    </table>

</asp:Content>

