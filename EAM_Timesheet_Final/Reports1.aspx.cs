using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnActivity_Click(object sender, EventArgs e)
    {
        Response.Redirect("RptManHours.aspx");
      

        //pass query string for accessing different methods based on reports.
    }
    protected void BtnLocHours_Click(object sender, EventArgs e)
    {
        Response.Redirect("RptLocHours.aspx");
    }
    protected void BtnProjHours_Click(object sender, EventArgs e)
    {
        Response.Redirect("RptProjHours.aspx");
    }
    protected void BtnListProj_Click(object sender, EventArgs e)
    {
        Response.Redirect("RptLstProj.aspx");
    }
    protected void BtnListDel_Click(object sender, EventArgs e)
    {
        Response.Redirect("RptLstDel.aspx");
    }
}