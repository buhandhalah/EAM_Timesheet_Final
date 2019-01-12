using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using EAMTimesheet.DAL;
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
    public partial class AddDeliverables1 : System.Web.UI.Page
    {
        clsLogin objLogin = new clsLogin();

        protected void Page_Load(object sender, EventArgs e)
        {
                
        if (!IsPostBack)
            {
            DataSet ds = GetLocation();
            ddlLocation.DataSource = ds;
            ddlLocation.DataTextField = "LOCDESC";
            ddlLocation.DataValueField = "LOCID";
            ddlLocation.DataBind();
            }
        BindGridview();
        }
// This method is used to bind gridview from database
            protected void BindGridview()
            {
            SqlConnection con = new SqlConnection("Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d");
            con.Open();
            SqlCommand cmd = new SqlCommand("select L.LOCDESC,D.DELNO,D.DELDESC from DELMASTER D, LOCMASTER L WHERE L.LOCID = D.LOCID", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            givDeliverablesInfo.DataSource = ds;
            givDeliverablesInfo.DataBind();
            }
    
        //if (!IsPostBack) //This will make sure that only once the below code will be executed.
        //{
            //DataSet ds = GetLocation();
            //ddlLocation.DataSource = ds;
            //ddlLocation.DataTextField = "LOCDESC";
            //ddlLocation.DataValueField = "LOCID";
            //ddlLocation.DataBind();

        //}


        public string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";
        public DataSet GetLocation()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            SqlCommand cmd = new SqlCommand("SP_picklocation", cnn);
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
        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlLocation.DataSource = GetLocation();
            ddlLocation.DataBind();
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            lblUserName.Text = Session["LoginName"].ToString();

            {
                string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_DELMASTER", con))
                    {
                        objLogin.Delnum = TxtDelNum.Text;

                    DataTable dtTrans = new DataTable();
                    dtTrans = objLogin.ValidateDel();
                    if (dtTrans.Rows.Count != 0)
                    {
                       
                        Response.Redirect("ErrorDel.aspx");
                        
                    }
                    else
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Insert";
                        cmd.Parameters.Add("@LOCID", SqlDbType.VarChar).Value = ddlLocation.SelectedValue.ToString();
                        cmd.Parameters.Add("@DELNO", SqlDbType.VarChar).Value = TxtDelNum.Text.ToString();
                        cmd.Parameters.Add("@DELDESC", SqlDbType.VarChar).Value = txtDelDesc.Text.ToString();
                        cmd.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = lblUserName.Text.ToString();
                     con.Open();
                    cmd.ExecuteNonQuery();   
                    }


                    }
                    }
                    }

                  BindGridview();
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

      

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ddlLocation.SelectedIndex = 0;
            txtDelDesc.Text = "";
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            lblUserName.Text = Session["LoginName"].ToString();

            {
                string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_DELMASTER", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Update";
                        cmd.Parameters.Add("@LOCID", SqlDbType.VarChar).Value = ddlLocation.SelectedValue.ToString();
                        cmd.Parameters.Add("@DELNO", SqlDbType.VarChar).Value = TxtDelNum.Text.ToString();
                        cmd.Parameters.Add("@DELDESC", SqlDbType.VarChar).Value = txtDelDesc.Text.ToString();
                        cmd.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = lblUserName.Text.ToString();
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            lblUserName.Text = Session["LoginName"].ToString();

            {
                string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_DELMASTER", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Mode", SqlDbType.VarChar).Value = "Delete";
                        cmd.Parameters.Add("@DELNO", SqlDbType.VarChar).Value = TxtDelNum.Text.ToString();
                        
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
}
