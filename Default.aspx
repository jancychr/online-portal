<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 800px; margin: 0 auto;background-color:#CCCCCC"">
        <table width="800px">
            <tr>
                <td colspan="3" 
                    style="font-size: xx-large; font-style: italic; color: #FF0000; font-weight: bold; background-color: #C0C0C0">
                    &nbsp;Online Service Center</td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/facultyPortal.jpg"
                        PostBackUrl="~/FacultyLogin.aspx" />
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/studentPortal.jpg"
                        PostBackUrl="~/Student_Login.aspx" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Red"
                        Text="Faculty Portal"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Red"
                        Text="Student Portal"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
