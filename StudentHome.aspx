<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true"
    CodeFile="StudentHome.aspx.cs" Inherits="StudentHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 1000px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <table cellpadding="5" cellspacing="5">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Blue"
                                Text="Student Profile"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Student ID :
                        </td>
                        <td>
                            <asp:Label ID="lblstudentID" runat="server"></asp:Label>
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
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Solid"
                    BorderWidth="3px" CellPadding="4" CellSpacing="2" Width="627px" 
                    onrowdatabound="GridView1_RowDataBound">
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
                        <asp:TemplateField HeaderText="Sno" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblsno" runat="server" Text='<%#bind("sno") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Code">
                            <ItemTemplate>
                                <asp:Label ID="lblcoursecode" runat="server" Text='<%#bind("CourseCode") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtcoursecode" runat="server" Text='<%#bind("CourseCode") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfcoursecode" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                Course Name</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblcourseName" runat="server" Text='<%#bind("courseName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtcourseName" runat="server" Text='<%#bind("courseName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfcourseName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Grade">
                            <ItemTemplate>
                                <asp:Label ID="lblGrade" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Total GPA">
                            <ItemTemplate>
                                <asp:Label ID="lblGpa" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
