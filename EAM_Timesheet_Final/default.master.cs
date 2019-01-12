using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _default : System.Web.UI.MasterPage
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
