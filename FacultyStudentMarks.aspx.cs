using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class FacultyStudentMarks : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            lblstudentinfo.Text = Request.Cookies["studentinfo"].Value;
            lblstudentid_marks.Text = Request.Cookies["student_ID"].Value;
            lblcoursecode.Text = Request.Cookies["course_Code"].Value;
            lblcoursename.Text = Request.Cookies["course_name"].Value;
            Marks_GetAll();
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            TextBox txtactivity = (TextBox)GridView2.FooterRow.FindControl("txtactivity");
            TextBox txttotal = (TextBox)GridView2.FooterRow.FindControl("txttotal");

            SqlCommand cmd = new SqlCommand("Marks_save", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Activity", txtactivity.Text);
            cmd.Parameters.AddWithValue("@Total", txttotal.Text);

            con.Open();

            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                Marks_GetAll();
            }
            else
            {
                Response.Write("Something went Wrong please check and try back again.");
            }


        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (GridView2.Rows.Count != 0)
        {
            if (lblstudentid_marks.Text == "")
            {
                return;
            }
            int i = 0;
            con.Open();
            for (i = 0; i <= GridView2.Rows.Count - 1; i++)
            {
                TextBox txtScore = (TextBox)GridView2.Rows[i].Cells[3].FindControl("txtScore");
                Label lblsno = (Label)GridView2.Rows[i].Cells[3].FindControl("lblsno");
                if (txtScore.Text != "")
                {
                    SqlCommand cmd = new SqlCommand("Student_marks_Insert", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@StudentID", System.Convert.ToInt32(lblstudentid_marks.Text));
                    cmd.Parameters.AddWithValue("@MarksSno", System.Convert.ToInt32(lblsno.Text));
                    cmd.Parameters.AddWithValue("@Marks", System.Convert.ToInt32(txtScore.Text));
                    cmd.Parameters.AddWithValue("@courseCode", lblcoursecode.Text);
                    cmd.ExecuteNonQuery();

                }
            }

            con.Close();
            Marks_GetAll();
        }
        else
        {
            Response.Write("Sorry No Details Found...!");
        }
    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        lblstudentinfo.Text = "";
        lblstudentid_marks.Text = "";
        Response.Redirect("Faculty_Home.aspx");
    }
    private void Marks_GetAll()
    {
        SqlCommand cmd = new SqlCommand("Marks_Getall", con);
        //cmd.Parameters.AddWithValue("@StudentID", System.Convert.ToInt32(lblstudentid_marks.Text));
        //cmd.Parameters.AddWithValue("@courseCode", lblcoursecode.Text);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        con.Open();
        GridView2.DataSource = cmd.ExecuteReader();
        GridView2.DataBind();
        con.Close();
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblsno = (Label)e.Row.FindControl("lblsno");
            TextBox txtScore = (TextBox)e.Row.FindControl("txtScore");
            SqlCommand cmd = new SqlCommand("Student_Marks_Getall_sno", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", System.Convert.ToInt32(lblstudentid_marks.Text));
            cmd.Parameters.AddWithValue("@MarksSno", System.Convert.ToInt32(lblsno.Text));
            cmd.Parameters.AddWithValue("@courseCode", lblcoursecode.Text);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtScore.Text = dr[0].ToString();
            }
            else
            {
                txtScore.Text = "";
            }
        }
    }
}