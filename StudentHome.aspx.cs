using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class StudentHome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            if (Request.Cookies["StuId"] == null)
                Response.Redirect("logout.aspx");


            int StuId = Convert.ToInt32(Request.Cookies["StuId"].Value);
            SqlCommand cmd = new SqlCommand("Student_profile", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentId", Convert.ToInt32(StuId));

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblstudentID.Text = dr[0].ToString();
                lblfname.Text = dr[1].ToString();
                lbllname.Text = dr[2].ToString();
                lblgender.Text = dr[3].ToString();
                lblemail.Text = dr[4].ToString();
            }


            con.Close();

            Get_Grid();
        }
    }
    private void Get_Grid()
    {

        SqlCommand cmd = new SqlCommand("Courses_getall", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        con.Open();
        GridView1.DataSource = cmd.ExecuteReader();
        GridView1.DataBind();
        con.Close();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblcoursecode = (Label)e.Row.FindControl("lblcoursecode");
            Label lblGrade = (Label)e.Row.FindControl("lblGrade");
            Label lblGpa = (Label)e.Row.FindControl("lblGpa");
            //lblGpa
            SqlCommand cmd = new SqlCommand("Student_Marks_AVG", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", System.Convert.ToInt32(lblstudentID.Text));
            cmd.Parameters.AddWithValue("@courseCode", lblcoursecode.Text);

            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblGrade.Text = dr[0].ToString();
                if (lblGrade.Text == "")
                    return;
                int score = System.Convert.ToInt32(lblGrade.Text);

                if (score >= 95 && score <= 100)
                {
                    lblGrade.Text = "A+";
                    lblGpa.Text = "4.0";
                }
                else if (score >= 90 && score < 95)
                {
                    lblGrade.Text ="A";
                    lblGpa.Text = "4.0";
                }
                else if (score >= 85 && score < 90)
                {
                    lblGrade.Text = "A-";
                    lblGpa.Text = "3.7";
                }
                else if (score >= 80 && score < 85)
                {
                    lblGrade.Text = "B+";
                    lblGpa.Text = "3.3";
                }
                else if (score >= 75 && score < 80)
                {
                    lblGrade.Text = "B";
                    lblGpa.Text = "3.0";
                }
                else if (score >= 70 && score < 75)
                {
                    lblGrade.Text = "B-";
                    lblGpa.Text = "2.7";
                }
                else if (score >= 65 && score < 70)
                {
                    lblGrade.Text = "C+";
                    lblGpa.Text = "2.3";
                }
                else if (score >= 60 && score < 65)
                {
                    lblGrade.Text = "C";
                    lblGpa.Text = "2.0";
                }
                else if (score >= 55 && score < 60)
                {
                    lblGrade.Text = "C-";
                    lblGpa.Text = "1.7";
                }
                else if (score >= 50 && score < 55)
                {
                    lblGrade.Text = "D+";
                    lblGpa.Text = "1.3";
                }
                else if (score >= 45 && score < 50)
                {
                    lblGrade.Text = "D";
                    lblGpa.Text = "1.0";
                }
                else if (score >= 40 && score < 45)
                {
                    lblGrade.Text = "D-";
                    lblGpa.Text = "0.7";
                }
                else if (score >= 0 && score < 40)
                {
                    lblGrade.Text = "F";
                    lblGpa.Text = "0";
                }

            }
            else
            {
                lblGrade.Text = "";
            }
        }
    }
}