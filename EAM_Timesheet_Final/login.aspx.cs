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

using EAMTimesheet.BLL;

public partial class login : System.Web.UI.Page
{
    clsLogin objLogin = new clsLogin();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        objLogin.Username = txtUsername.Text;
        objLogin.Password = txtPassword.Text;
        DataTable dtUser = new DataTable();
        dtUser = objLogin.ValidateLogin();
        if (dtUser.Rows.Count == 0)
        {
            lblMessage.Text = "Invalid Credentials!";
        }
        else
        {
            DataRow drLogin;
            drLogin = dtUser.Rows[0];
            Session["LoginName"] = drLogin["LoginName"].ToString();
            Session["Rights"] = drLogin["Rights"].ToString();
            Response.Redirect("AddNewProject.aspx");
        }
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {

    }
}
