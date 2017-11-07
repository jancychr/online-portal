<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_Login.aspx.cs" Inherits="Student_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 800px; margin: 0 auto;background-color:#CCCCCC">
        <table class="style1">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx">Log On</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3366FF"
                                    Text="Student Login"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                User Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername"
                                    ErrorMessage="Enter username" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtusername"
                                    ErrorMessage="Only 5 Digits" Font-Bold="True" ForeColor="Red" ValidationExpression="\d{5}"
                                    ValidationGroup="0"></asp:RegularExpressionValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword"
                                    ErrorMessage="Enter password" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnlogin" runat="server" Font-Bold="True" OnClick="btnsave_Click"
                                    Text="Login" ValidationGroup="0" />
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
                            <td align="right" colspan="3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Student_Registration.aspx">Click here to Register</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
