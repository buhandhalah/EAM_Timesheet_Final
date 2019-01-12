using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["LoginName"] == null) || (Session["LoginName"].ToString() == ""))
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            lblHeaderMessage.Text = "Welcome " + Session["LoginName"].ToString();
        }
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session["LoginName"] = null;
        Session["Rights"] = null;
        Response.Redirect("login.aspx");
    }
}
