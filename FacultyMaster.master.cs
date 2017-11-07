using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["facId"] == null)
            Response.Redirect("FacultyLogin.aspx");
        lblusername.Text = "Welcome : " + Request.Cookies["facId"].Value.ToString();
    }
}
