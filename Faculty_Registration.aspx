<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Faculty_Registration.aspx.cs"
    Inherits="Faculty_Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Registration</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 800px; margin: 0 auto; background-color: #CCCCCC;">
        <table cellpadding="5" cellspacing="5">
            <tr>
                <td colspan="3" align="center">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Blue"
                        Text="Faculty Registration"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    First Name
                </td>
                <td>
                    <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfname"
                        ErrorMessage="Enter First name" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Last Name
                </td>
                <td>
                    <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlname"
                        ErrorMessage="Enter last name" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Gender
                </td>
                <td>
                    <asp:DropDownList ID="drpgender" runat="server">
                        <asp:ListItem>Please Select</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drpgender"
                        ErrorMessage="Select gender" Font-Bold="True" ForeColor="Red" InitialValue="Please Select"
                        ValidationGroup="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Select Course
                </td>
                <td>
                    <asp:DropDownList ID="drpselectcourse" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drpselectcourse"
                        ErrorMessage="Select Course" Font-Bold="True" ForeColor="Red" InitialValue="Please Select"
                        ValidationGroup="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email Address
                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtemail"
                        ErrorMessage="Enter Email Address" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpassword"
                        ErrorMessage="Enter password" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm password
                </td>
                <td>
                    <asp:TextBox ID="txtconpasssword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtconpasssword"
                        ErrorMessage="Re-Enter password " Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword"
                        ControlToValidate="txtconpasssword" ErrorMessage="Password Must be match" Font-Bold="True"
                        ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnsave" runat="server" Text="Save" Font-Bold="True" OnClick="btnsave_Click"
                        ValidationGroup="0" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="lblmessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" align="right">
                    &nbsp; &nbsp; &nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/FacultyLogin.aspx">If Already Registered click here to login</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
