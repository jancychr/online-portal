<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMaster.master" AutoEventWireup="true"
    CodeFile="Faculty_Home.aspx.cs" Inherits="Faculty_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="5" cellspacing="5">
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Blue"
                    Text="Faculty Profile"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                First Name :
            </td>
            <td>
                <asp:Label ID="lblfname" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Last Name :
            </td>
            <td>
                <asp:Label ID="lbllname" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Gender :
            </td>
            <td>
                <asp:Label ID="lblgender" runat="server">
                    
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Email Address :
            </td>
            <td>
                <asp:Label ID="lblemail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Course Name :
            </td>
            <td>
                <asp:Label ID="lblcoursecode" runat="server"></asp:Label>
&nbsp;-
                <asp:Label ID="lblcoursename" runat="server"></asp:Label>
                &nbsp;
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC"
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
                    ForeColor="Black" OnRowDeleting="GridView1_RowDeleting">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                    <Columns>
                        <%--studentId	fname	lname	Gender	Email	Pasword--%>
                        <asp:TemplateField HeaderText="Student Id">
                            <ItemTemplate>
                                <asp:Label ID="lblstudentId" runat="server" Text='<%#bind("studentId") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="lblfname" runat="server" Text='<%#bind("fname") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="lbllname" runat="server" Text='<%#bind("lname") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Label ID="lblGender" runat="server" Text='<%#bind("Gender") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%#bind("Email") %>'></asp:Label></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit Marks">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                    Text="Edit Marks"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
