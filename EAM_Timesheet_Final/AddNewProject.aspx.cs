using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using EAMTimesheet.DAL;
using EAMTimesheet.BLL;
public partial class _Default : System.Web.UI.Page
{
    clsLogin objLogin = new clsLogin();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) //This will make sure that only once the below code will be executed.
        {
            DataSet ds = GetLocation();
            ddlLocation.DataSource = ds;
            ddlLocation.DataTextField = "LOCDESC";
            ddlLocation.DataValueField = "LOCID";
            ddlLocation.DataBind();
          BindGridview();
        }
        }
// This method is used to bind gridview from database
            protected void BindGridview()
            {
            SqlConnection con = new SqlConnection("Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d");
            con.Open();
            SqlCommand cmd = new SqlCommand("select L.LOCDESC,P.PROJNO,P.PROJDESC,P.EPCCOMP from PROJMASTER P,LOCMASTER L WHERE L.LOCID = P.LOCID", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            givProjectInfo.DataSource = ds;
            givProjectInfo.DataBind();
            }
        
    

    public string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

    public DataSet GetLocation()
    {
        SqlConnection cnn = new SqlConnection(connetionString);
        SqlCommand cmd = new SqlCommand("SP_picklocation",cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            cnn.Open();
            da.Fill(ds);
            
            cnn.Close();
        }
        catch (Exception ex)
        {
            //write error message
        }
        return ds; 
    }

    protected void Connection()
    {
        string connetionString = null;
        SqlConnection cnn;
        //	connetionString = "Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"

        connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";
        cnn = new SqlConnection(connetionString);
        try
        {
            cnn.Open();
            //   MessageBox.Show ("Connection Open ! ");
            cnn.Close();
        }
        catch (Exception ex)
        {
            lblConnection.Visible = true;
        }
        
    }


    protected void BtnSave_Click(object sender, EventArgs e)
    {
        lblUserName.Text = Session["LoginName"].ToString();

        {
            string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("SP_PROJMASTER", con))
                {
                    objLogin.Projnum = TxtProjectNum.Text;

                    DataTable dtTrans = new DataTable();
                    dtTrans = objLogin.ValidateProj();
                    if (dtTrans.Rows.Count != 0)
                    {
                        // lblMessage.Text = "Transaction Number Already Exists!";
                        //cmd.CommandType = CommandType.StoredProcedure;
                        //Response.Redirect("RptLocHours.aspx");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(),"Scripts","<script>alert('Transaction Number Already Exists!');</script>");
                        Response.Redirect("ErrorProj.aspx");

                    }
                    else
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Insert";
                        cmd.Parameters.Add("@LOCID", SqlDbType.VarChar).Value = ddlLocation.SelectedValue.ToString();
                        cmd.Parameters.Add("@PROJNO", SqlDbType.VarChar).Value = TxtProjectNum.Text.ToString();
                        cmd.Parameters.Add("@PROJDESC", SqlDbType.VarChar).Value = TxtProjctName.Text.ToString();
                        cmd.Parameters.Add("@EPCCOMP", SqlDbType.VarChar).Value = TxtEpcComp.Text.ToString();
                        cmd.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = lblUserName.Text.ToString();
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
        BindGridview();
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
       TxtProjectNum.Text= "";
       TxtProjctName.Text= "";
       TxtEpcComp.Text= "";
       ddlLocation.SelectedIndex = 0; 
    }
    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {

        ddlLocation.DataSource = GetLocation();
        ddlLocation.DataBind();
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        lblUserName.Text = Session["LoginName"].ToString();

        {
            string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("SP_PROJMASTER", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Update";
                    cmd.Parameters.Add("@LOCID", SqlDbType.VarChar).Value = ddlLocation.SelectedValue.ToString();
                    cmd.Parameters.Add("@PROJNO", SqlDbType.VarChar).Value = TxtProjectNum.Text.ToString();
                    cmd.Parameters.Add("@PROJDESC", SqlDbType.VarChar).Value = TxtProjctName.Text.ToString();
                    cmd.Parameters.Add("@EPCCOMP", SqlDbType.VarChar).Value = TxtEpcComp.Text.ToString();
                    cmd.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = lblUserName.Text.ToString();
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
        BindGridview();
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        lblUserName.Text = Session["LoginName"].ToString();

        {
            string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("SP_PROJMASTER", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Delete";
                   
                    cmd.Parameters.Add("@PROJNO", SqlDbType.VarChar).Value = TxtProjectNum.Text.ToString();
                    con.Open();
                    cmd.ExecuteNonQuery();
                    
                }
            }
        }
        BindGridview();
    }
}
