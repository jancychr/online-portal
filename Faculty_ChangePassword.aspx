<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMaster.master" AutoEventWireup="true" CodeFile="Faculty_ChangePassword.aspx.cs" Inherits="Faculty_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style3
        {
            width: 600px;
        }
        .style4
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="style3">
        <tr>
            <td class="style4" colspan="3">
                <strong>Change Password :</strong>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblmessage" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Enter Old Password :
            </td>
            <td>
                <asp:TextBox ID="txtoldpassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtoldpassword"
                    ErrorMessage="Enter Old Password" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Enter New Password :
            </td>
            <td>
                <asp:TextBox ID="txtnewpassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnewpassword"
                    ErrorMessage="Enter New Password" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Re-Enter New Password :
            </td>
            <td>
                <asp:TextBox ID="txtreenternewpassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtreenternewpassword"
                    ErrorMessage="Re-Enter New Password" Font-Bold="True" ForeColor="Red" ValidationGroup="0"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="New Password Not Matching"
                    ForeColor="Red" ControlToCompare="txtnewpassword" ControlToValidate="txtreenternewpassword"
                    Font-Bold="True" ValidationGroup="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                &nbsp;
                <asp:Button ID="btnchangepassword" runat="server" Text="Change password" Font-Bold="true"
                    ValidationGroup="0" OnClick="btnchangepassword_Click" />
                <asp:Button ID="btncancel" runat="server" Text="Cancel" Font-Bold="true" OnClick="btncancel_Click" />
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

