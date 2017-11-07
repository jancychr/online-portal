using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Faculty_Home : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            if (Request.Cookies["facId"] == null)
                Response.Redirect("FacultyLogin.aspx");


            int facId = Convert.ToInt32(Request.Cookies["facId"].Value);

            SqlCommand cmd = new SqlCommand("Faculty_profile", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FacultyId", Convert.ToInt32(facId));

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblfname.Text = dr[1].ToString();
                lbllname.Text = dr[2].ToString();
                lblgender.Text = dr[3].ToString();
                lblemail.Text = dr[4].ToString();
                lblcoursecode.Text = dr[5].ToString();
                lblcoursename.Text = dr[6].ToString();
            }

            con.Close();
            get_studentList();
        }
    }
    private void get_studentList()
    {
        SqlCommand cmd = new SqlCommand("Student_getall", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        con.Open();
        GridView1.DataSource = cmd.ExecuteReader();
        GridView1.DataBind();
        con.Close();


    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        Label lblstudentId = (Label)row.FindControl("lblstudentId");
        Label lblfname = (Label)row.FindControl("lblfname");
        Label lbllname = (Label)row.FindControl("lbllname");
        int StudentID = System.Convert.ToInt32(lblstudentId.Text);

        if (StudentID != 0)
        {
            Response.Cookies["studentinfo"].Value = "Student Name : " + lbllname.Text + " " + lblfname.Text + "<br/><br/>" + "Student Id:" + lblstudentId.Text;
            Response.Cookies["student_ID"].Value = StudentID.ToString();
            Response.Cookies["course_Code"].Value = lblcoursecode .Text ;
            Response.Cookies["course_name"].Value = lblcoursename.Text;
            Response.Redirect("FacultyStudentMarks.aspx");
        }
        else
        {
            lblstudentId.Text = "";
            //Panel1.Visible = false;
        }


    }
   
  
}