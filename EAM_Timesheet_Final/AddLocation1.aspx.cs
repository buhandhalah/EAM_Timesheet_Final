using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using EAMTimesheet.DAL;

public partial class AddLocation1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
{
BindGridview();
}
}
// This method is used to bind gridview from databa
    protected void BindGridview()
            {
            SqlConnection con = new SqlConnection("Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d");
            con.Open();
            SqlCommand cmd = new SqlCommand("select LOCID,LOCDESC from LOCMASTER", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            givLocationInfo.DataSource = ds;
            givLocationInfo.DataBind();
            }
    
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        {
            lblUserName.Text = Session["LoginName"].ToString();

            {
                string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_tblLocation", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Insert";
                        cmd.Parameters.Add("@LOCID", SqlDbType.VarChar).Value = TxtlocId.Text.ToString();
                        cmd.Parameters.Add("@LOCDESC", SqlDbType.VarChar).Value = LOCDESC.Text.ToString();
                        cmd.Parameters.Add("@USERNAME", SqlDbType.NVarChar).Value = lblUserName.Text.ToString();
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
        TxtlocId.Text = "";
        LOCDESC.Text = "";
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        {
            lblUserName.Text = Session["LoginName"].ToString();

            {
                string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_tblLocation", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Update";
                        cmd.Parameters.Add("@LOCID", SqlDbType.VarChar).Value = TxtlocId.Text.ToString();
                        cmd.Parameters.Add("@LOCDESC", SqlDbType.VarChar).Value = LOCDESC.Text.ToString();
                        cmd.Parameters.Add("@USERNAME", SqlDbType.NVarChar).Value = lblUserName.Text.ToString();
                        con.Open();
                        cmd.ExecuteNonQuery();

                    }
                }
            }
        } 
        BindGridview();
    }
    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        {
            lblUserName.Text = Session["LoginName"].ToString();

            {
                string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_tblLocation", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Delete";
                        cmd.Parameters.Add("@LOCID", SqlDbType.VarChar).Value = TxtlocId.Text.ToString();
                        
                        con.Open();
                        cmd.ExecuteNonQuery();

                    }
                }
            }
        }
        BindGridview();
    }
}