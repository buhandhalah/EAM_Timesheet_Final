using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class RptLstProj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //GetLocation();
            BindGridview();
        }
    }
    public string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

    protected void BindGridview()
    {
        SqlConnection con = new SqlConnection("Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d");
        con.Open();
         SqlCommand cmd =
         new SqlCommand
        ("select LOCMASTER.LOCDESC,PROJMASTER.PROJNO,PROJMASTER.PROJDESC,PROJMASTER.EPCCOMP from PROJMASTER INNER JOIN LOCMASTER ON LOCMASTER.LOCID = PROJMASTER.LOCID Order by LOCMASTER.LOCDESC"
        , con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        givDisplayHours.DataSource = ds;
        givDisplayHours.DataBind();
    }
}