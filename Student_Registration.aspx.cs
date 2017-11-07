using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Student_Registration : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Student_save", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@fname", txtfname.Text);
        cmd.Parameters.AddWithValue("@lname", txtlname.Text);
        cmd.Parameters.AddWithValue("@Gender", drpgender.Text);
        cmd.Parameters.AddWithValue("@Email", txtemail.Text);
        cmd.Parameters.AddWithValue("@Pasword", txtpassword.Text);

        SqlParameter outParam = new SqlParameter();
        outParam.ParameterName = "@studentId";
        outParam.SqlDbType = System.Data.SqlDbType.BigInt;
        outParam.Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add(outParam);

        con.Open();

        int i = cmd.ExecuteNonQuery();

        if (i > 0)
        {
            //string stuId = outParam.Value.ToString();
            lblmessage.Text = "Successfully Student details Saved and UserId is : " + outParam.Value.ToString();
            clear();
        }
        else
        {
            lblmessage.Text = "E-Mail Id Already Exist..!";
            //lblmessage.Text = "Something went Wrong please check and try back again.";
        }
        con.Close();

    }
    private void clear() { txtfname.Text = ""; txtlname.Text = ""; drpgender.SelectedIndex = 0; txtemail.Text = ""; txtpassword.Text = ""; }
}