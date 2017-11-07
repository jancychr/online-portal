using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Faculty_ChangePassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        lblmessage.Text = "";

    }
    protected void btnchangepassword_Click(object sender, EventArgs e)
    {
        //@studentID
        SqlCommand cmd = new SqlCommand("faculty_changepassword", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StudentId", Convert.ToInt32(Request.Cookies["StuId"].Value));
        cmd.Parameters.AddWithValue("@oldpwd", txtoldpassword.Text);
        cmd.Parameters.AddWithValue("@newpwd", txtnewpassword.Text);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        { lblmessage.Text = "Successfully password changed."; }
        else { lblmessage.Text = "Old password wrong."; }
        con.Close();
    }
}