using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class FacultyLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void btnsave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Faculty_Login", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@FacultyId", Convert.ToInt32(txtusername.Text));
        cmd.Parameters.AddWithValue("@pasword", txtpassword.Text);

        con.Open();
        int count = (int)cmd.ExecuteScalar();

        if (count == 1)
        {
            // lblmessage.Text = "User Exist..";
            Response.Cookies["facId"].Value = txtusername.Text;
            Response.Redirect("Faculty_Home.aspx");
        }
        else
            lblmessage.Text = "Invalid username/Password";

        con.Close();
    }

}