using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Student_Login : System.Web.UI.Page
{
   
    protected void btnsave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Student_login", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@studentId", Convert.ToInt32(txtusername.Text));
        cmd.Parameters.AddWithValue("@pasword", txtpassword.Text);

        con.Open();

        int i = (int)cmd.ExecuteScalar();
        if (i > 0)
        {
            Response.Cookies["StuId"].Value = txtusername.Text;
            Response.Redirect("StudentHome.aspx");

        }
        else 
        {
            lblmessage.Text = "Invalid username/Password";
        }

    }
}