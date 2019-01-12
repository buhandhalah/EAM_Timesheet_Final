using System;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EAMTimesheet.BLL;
public partial class TimeSheet1 : System.Web.UI.Page
{
    clsLogin objLogin = new clsLogin();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGridview();
        if (!IsPostBack) //This will make sure that only once the below code will be executed.
        {
            DataSet ds = GetLocation();
            ddlLocation.DataSource = ds;
            ddlLocation.DataTextField = "LOCDESC";
            ddlLocation.DataValueField = "LOCID";
            ddlLocation.DataBind();
           
        }
       
        if (!IsPostBack) //This will make sure that only once the below code will be executed.
        {
            DataSet ds = GetProjects();
            ddlProjects.DataSource = ds;
            ddlProjects.DataTextField = "PROJDESC";
            ddlProjects.DataValueField = "PROJNO";
            ddlProjects.DataBind();

        }
        if (!IsPostBack) //This will make sure that only once the below code will be executed.
        {
            
            DataSet ds = GetDeliverables();
            ddlDeliverables.DataSource = ds;
            ddlDeliverables.DataTextField = "DELDESC";
            ddlDeliverables.DataValueField = "DELNO";
            ddlDeliverables.DataBind();

        }
    }
         protected void BindGridview()
         {
        SqlConnection con = new SqlConnection("Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d");
        con.Open();
        SqlCommand cmd = new SqlCommand("select TRANSNUM,WORKDATE,LOCDESC,PROJDESC,DELDESC,WORKHRS from TRANSACTIONS", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        givTimesheetInfo.DataSource = ds;
        givTimesheetInfo.DataBind();
        }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        lblUserName.Text = Session["LoginName"].ToString();

        {
             string   connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";
        
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("SP_TRANSACTIONS", con))
                {
                    objLogin.Transnum = txtTransNum.Text;

                    DataTable dtTrans = new DataTable();
                    dtTrans = objLogin.ValidateTrans();
                    if (dtTrans.Rows.Count != 0)
                    {
                        Response.Redirect("ErrorTrans.aspx");     
                    }
                    else
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Mode", SqlDbType.NVarChar).Value = "Insert";
                        cmd.Parameters.Add("@TRANSNUM", SqlDbType.NVarChar).Value = txtTransNum.Text.ToString();
                        cmd.Parameters.Add("@WORKDATE", SqlDbType.NVarChar).Value = lblDatepicker.Text.ToString();
                        cmd.Parameters.Add("@LOCDESC", SqlDbType.NVarChar).Value = ddlLocation.SelectedItem.Text;
                        cmd.Parameters.Add("@PROJDESC", SqlDbType.NVarChar).Value = ddlProjects.SelectedItem.Text;
                        cmd.Parameters.Add("@DELDESC", SqlDbType.NVarChar).Value = ddlDeliverables.SelectedItem.Text;
                        cmd.Parameters.Add("@WORKHRS", SqlDbType.NVarChar).Value = txtHours.Text.ToString();
                        cmd.Parameters.Add("@USERNAME", SqlDbType.NVarChar).Value = lblUserName.Text.ToString();
                    }
                    con.Open();
                    cmd.ExecuteNonQuery();
                
                }

             //   BindGridview();
            }
           
            //else
            //{
            //    DataRow drLogin;
            //    drLogin = dtUser.Rows[0];
            //    Session["LoginName"] = drLogin["LoginName"].ToString();
            //    Session["Rights"] = drLogin["Rights"].ToString();
            //    Response.Redirect("AddNewProject.aspx");
            //}
        }
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
    
    public DataSet GetProjects()
    {
        SqlConnection cnn = new SqlConnection(connetionString);
        SqlCommand cmd = new SqlCommand("SP_pickprojects", cnn);
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
    public DataSet GetDeliverables()
    {
        SqlConnection cnn = new SqlConnection(connetionString);
        SqlCommand cmd = new SqlCommand("SP_pickdeliverables", cnn);
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
    protected void CalDate_SelectionChanged(object sender, EventArgs e)
    {
        lblDatepicker.Text = CalDate.SelectedDate.ToString();
    }
    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlLocation.DataSource = GetLocation();
        ddlLocation.DataBind();
    }
    protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlProjects.DataSource = GetProjects();
        ddlProjects.DataBind();
    }
    protected void ddlDeliverables_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDeliverables.DataSource = GetDeliverables();
        ddlDeliverables.DataBind();
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        
        ddlLocation.SelectedIndex = 0;
        ddlProjects.SelectedIndex = 0;
        ddlDeliverables.SelectedIndex = 0;
        txtHours.Text = "";
        lblDatepicker.Text = "";
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        lblUserName.Text = Session["LoginName"].ToString();

        {
            string connetionString = "Data Source=ANONYMOUS-PC\\SQLEXPRESS;Initial Catalog=EmployeeDB;User ID=sa;Password=Mo7am00d";

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("SP_TRANSACTIONS", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Mode", SqlDbType.NVarChar).Value = "Update";
                    cmd.Parameters.Add("@TRANSNUM", SqlDbType.NVarChar).Value = txtTransNum.Text.ToString();
                    cmd.Parameters.Add("@WORKDATE", SqlDbType.NVarChar).Value = lblDatepicker.Text.ToString();
                    cmd.Parameters.Add("@LOCDESC", SqlDbType.NVarChar).Value = ddlLocation.SelectedItem.Text;
                    cmd.Parameters.Add("@PROJDESC", SqlDbType.NVarChar).Value = ddlProjects.SelectedItem.Text;
                    cmd.Parameters.Add("@DELDESC", SqlDbType.NVarChar).Value = ddlDeliverables.SelectedItem.Text;
                    cmd.Parameters.Add("@WORKHRS", SqlDbType.NVarChar).Value = txtHours.Text.ToString();
                    cmd.Parameters.Add("@USERNAME", SqlDbType.NVarChar).Value = lblUserName.Text.ToString();

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
                using (SqlCommand cmd = new SqlCommand("SP_TRANSACTIONS", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Mode", SqlDbType.NVarChar).Value = "Delete";
                    cmd.Parameters.Add("@TRANSNUM", SqlDbType.NVarChar).Value = txtTransNum.Text.ToString();
                    

                    con.Open();
                    cmd.ExecuteNonQuery();

                }
            }
        }
    }

    protected void givTimesheetInfo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnExcel_Click(object sender, EventArgs e)
    {
        GridviewToExcel();
    }

    public void GridviewToExcel()
    {


        StringBuilder builder = new StringBuilder(); 
        string strFileName = "GridviewExcel_" + DateTime.Now.ToShortDateString() + ".csv";
        builder.Append("TRANSNUM ,WORKDATE,Location, PROJDESC,DELDESC,WORKHRS " + Environment.NewLine);
        Response.ContentType = "text/csv";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + strFileName);
        givTimesheetInfo.HeaderRow.Style.Add("background-color", "#95c556");
        foreach (GridViewRow row in givTimesheetInfo.Rows)
        {
            string TRANSNUM = row.Cells[0].Text;
            string WORKDATE = row.Cells[1].Text;
            string LOCDESC = row.Cells[2].Text;
            string PROJDESC = row.Cells[3].Text;
            string DELDESC = row.Cells[4].Text;
            string WORKHRS = row.Cells[5].Text;
            
            builder.Append(TRANSNUM + "," + WORKDATE + "," + LOCDESC + ","+ PROJDESC + "," + DELDESC + "," + WORKHRS + Environment.NewLine);
        }




        Response.Clear();

        Response.Write(builder.ToString());
        Response.End();
    }
}