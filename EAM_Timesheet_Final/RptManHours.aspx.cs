using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class RptManHours : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            BindGridview();
        }
    }
    protected void BindGridview()
    {
        SqlConnection con = new SqlConnection("Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d");
        con.Open();
        SqlCommand cmd = new SqlCommand("select PROJDESC,WORKHRS,USERNAME from TRANSACTIONS Group by PROJDESC, WORKHRS, USERNAME", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        givDisplayHours.DataSource = ds;
        givDisplayHours.DataBind();
    }

    public string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

    //public void GetLocation()
    //{
    //    SqlConnection cnn = new SqlConnection(connetionString);
    //    SqlCommand cmd = new SqlCommand("REPORTS1", cnn);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "ManHours";
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    DataSet ds = new DataSet();
        
    //        cnn.Open();
    //        da.Fill(ds);

    //        cnn.Close();

    //        givDisplayHours.DataSource = ds;
    //   givDisplayHours.DataBind();
    //}
    protected void gvDisplayHours_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}