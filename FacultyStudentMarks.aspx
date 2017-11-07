<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMaster.master" AutoEventWireup="true"
    CodeFile="FacultyStudentMarks.aspx.cs" Inherits="FacultyStudentMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <table class="style3">
            <tr>
                <td>
                    <asp:Label ID="lblstudentinfo" runat="server" Font-Bold="True" ForeColor="#3366FF"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Course Code :
                    <asp:Label ID="lblcoursecode" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Course Name :
                    <asp:Label ID="lblcoursename" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                        OnRowCommand="GridView2_RowCommand" ShowFooter="True" OnRowDataBound="GridView2_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Sno" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblsno" runat="server" Text='<%#bind("sno") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Activity">
                                <ItemTemplate>
                                    <asp:Label ID="lblActivity" runat="server" Text='<%#bind("Activity") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtactivity" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Text='<%#bind("Total") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txttotal" runat="server" Text="100"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Score">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtScore" runat="server"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="AddNew"
                                        Text="Add New" ValidationGroup="new1"></asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnupdate" runat="server" Font-Bold="True" OnClick="btnupdate_Click"
                        Text="Update" />
                    <asp:Label ID="lblstudentid_marks" runat="server" Visible="false"></asp:Label>
                    <asp:Button ID="btnclose" runat="server" Font-Bold="True" OnClick="btnclose_Click"
                        Text="Close" />
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>
</asp:Content>
