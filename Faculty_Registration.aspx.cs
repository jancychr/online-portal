using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Faculty_Registration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void btnsave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Faculty_Insert", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@fname", txtfname.Text);
        cmd.Parameters.AddWithValue("@lname", txtlname.Text);
        cmd.Parameters.AddWithValue("@gender", drpgender.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);
        cmd.Parameters.AddWithValue("@pasword", txtpassword.Text);
        cmd.Parameters.AddWithValue("@courseCode", drpselectcourse.SelectedValue);

        //For out parameter 
        SqlParameter outP = new SqlParameter();
        outP.ParameterName = "@FacultyId";
        outP.SqlDbType = System.Data.SqlDbType.BigInt;
        outP.Direction = System.Data.ParameterDirection.Output;
        cmd.Parameters.Add(outP);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            lblmessage.Text = "Successfully details saved and UserId is : " + outP.Value.ToString();
            clear();
        }
        else
        {
            lblmessage.Text = "E-Mail Id Already Exist..!";
            //lblmessage.Text = "Something went Wrong please check and try back again.";
        }
        con.Close();

       

    }
    private void clear()
    {
        txtfname.Text = "";
        txtlname.Text = "";
        txtemail.Text = "";
        txtpassword.Text = "";
        drpgender.SelectedIndex = 0;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            Fill_dropdownlist();
        }
    }
    private void Fill_dropdownlist()
    {
        SqlCommand cmd = new SqlCommand("Courses_GetAll", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        DataSet ds = new DataSet();
        ds.Tables.Add(dt);
        if (ds.Tables[0].Rows.Count > 0)
        {
            drpselectcourse.DataSource = ds.Tables[0];
            drpselectcourse.DataValueField = ds.Tables[0].Columns[1].ToString();
            drpselectcourse.DataTextField = ds.Tables[0].Columns[2].ToString();
            drpselectcourse.DataBind();
            drpselectcourse.Items.Insert(0, "Please Select");
        }
        else
        {
            drpselectcourse.Items.Clear();
            drpselectcourse.Items.Insert(0, "Please Select");
        }

        con.Close();
    }
}
