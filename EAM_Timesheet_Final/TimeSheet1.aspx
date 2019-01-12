<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="TimeSheet1.aspx.cs" Inherits="TimeSheet1" %>

<%--<asp:Content ID="HeaderContent" ContentPlaceHolderID="cphRight" runat="server">
</asp:Content>--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 align="center">TIME SHEET</h2>

    <table style="width: 70%;">
        <tr>
            <td class="auto-style1">&nbsp;
                <asp:Label ID="lblDate" runat="server" Text="" class="section_label"></asp:Label>
            </td>

            <asp:Label ID="lblDatepicker" runat="server" class="section_label"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="auto-style2" colspan="4">
                <asp:Calendar ID="CalDate" runat="server" OnSelectionChanged="CalDate_SelectionChanged" Height="180px" Width="256px" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Style="margin-bottom: 0px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;
        <asp:Label ID="lblTransNum" runat="server" Text="Transaction Number" class="section_label"></asp:Label></td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

        <td class="auto-style6" colspan="4">
            <asp:TextBox ID="txtTransNum" runat="server" class="section_textbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;
                <asp:Label ID="lblLocation" runat="server" Text="Location" class="section_label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="auto-style3" colspan="4">
                <asp:DropDownList ID="ddlLocation" runat="server" class="section_textbox"
                    DataTextField="LOCDESC" DataValueField="LOCID"
                    Height="21px" Width="185px"
                    OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" AppendDataBoundItems="True">
                </asp:DropDownList></td>
        </tr>

        <tr>
            <td class="auto-style4">&nbsp;
        <asp:Label ID="lblProjectName" runat="server" Text="Projects" class="section_label"></asp:Label>
            </td>
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
         <td class="auto-style3" colspan="4">
             <asp:DropDownList ID="ddlProjects" runat="server" class="section_textbox"
                 DataTextField="PROJDESC" DataValueField="PROJNO"
                 Height="21px" Width="185px"
                 OnSelectedIndexChanged="ddlProjects_SelectedIndexChanged" AppendDataBoundItems="True">
             </asp:DropDownList></td>
        </tr>

        <tr>
            <td class="auto-style4">&nbsp;
        <asp:Label ID="lblDelDesc" runat="server" Text="Deliverables" class="section_label"></asp:Label></td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <td class="auto-style3" colspan="4">
           <asp:DropDownList ID="ddlDeliverables" runat="server" class="section_textbox"
               DataTextField="DELDESC" DataValueField="DELNO"
               Height="21px" Width="185px"
               OnSelectedIndexChanged="ddlDeliverables_SelectedIndexChanged" AppendDataBoundItems="True">
           </asp:DropDownList></td>
        </tr>

        <tr>
            <td class="auto-style4">&nbsp;
        <asp:Label ID="lblHours" runat="server" Text="Hours Worked" class="section_label"></asp:Label></td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

        <td class="auto-style3" colspan="4">
            <asp:TextBox ID="txtHours" runat="server" class="section_textbox"></asp:TextBox></td>
        </tr>

        <tr>
            <td>
                <asp:Button ID="BtnSave" runat="server" Text="SAVE" class="buttonBlue"
                    OnClick="BtnSave_Click" Height="35px" Width="95px" /></td>

            <td class="auto-style9">
                <asp:Button ID="BtnClear" runat="server" Text="CLEAR ALL"
                    class="buttonBlue" OnClick="BtnClear_Click" Height="35px" Width="95px" /></td>

            <td class="auto-style7">
                <asp:Button ID="BtnUpdate" runat="server" Text="UPDATE"
                    class="buttonBlue" Height="35px" Width="95px" OnClick="BtnUpdate_Click" /></td>

            <td class="auto-style10">
                &nbsp;</td>

            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnDelete" runat="server" Text="DELETE"
                    class="buttonBlue" Height="35px" Width="95px" OnClick="BtnDelete_Click" /></td>
            <td>&nbsp;<td>
                <asp:Button ID="btnExcel" runat="server" Text="Table to Excel"
                    class="buttonBlue" Height="35px" Width="95px" OnClick="btnExcel_Click" /></td>
            <td>
                &nbsp;</td>

             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTransNum"
            Display="None" ErrorMessage="  Please enter the Transaction Number" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>
           
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHours"
            Display="None" ErrorMessage="  Please enter Number of hours worked" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>
        
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="false"
            ShowSummary="True" HeaderText="You must enter the following" ForeColor="Red" />--%>
        </tr>

    </table>

    <td colspan="2" align="center"  class="post_title"><asp:label ID="lblMessage" runat="server" /></td>

    <br />
    <br />
    <br />
    <br />
   <div>
<asp:GridView ID="givTimesheetInfo" CssClass="table table-striped table-bordered table-hover" PageSize="10" AllowPaging="true" runat="server" AutoGenerateColumns="false" Height="165px" Width="806px" style="margin-left: 6px" OnSelectedIndexChanged="givTimesheetInfo_SelectedIndexChanged">
<HeaderStyle BackColor="Blue" Font-Bold="true"  ForeColor="White" />
<Columns>
<asp:BoundField DataField="WORKDATE" HeaderText="Date Worked" />
<asp:BoundField DataField="TRANSNUM" HeaderText="Transaction Number" />
<asp:BoundField DataField="LOCDESC" HeaderText="Location Description" />
<asp:BoundField DataField="PROJDESC" HeaderText="Project Description" />
<asp:BoundField DataField="DELDESC" HeaderText="Deliverables Description" />
<asp:BoundField DataField="WORKHRS" HeaderText="Hours Worked" />    
</Columns>
</asp:GridView>
</div>
    <br />
    <br />
    <asp:Label ID="lblConnection" runat="server" Text="Sorry! No Connectivity" Visible="false"></asp:Label>
    <asp:Label ID="lblUserName" runat="server" Visible="False" class="section_label" Text="Username"></asp:Label>
</asp:Content>
    

<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            height: 2px;
            width: 164px;
        }
        .auto-style2 {
            height: 2px;
            }
        .auto-style3 {
        }
        .auto-style4 {
            width: 164px;
        }
        .auto-style5 {
            width: 164px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 6px;
        }
        .auto-style9 {
            width: 147px;
        }
        .auto-style10 {
            width: 38px;
        }

        /*gridview*/
.table table  tbody  tr  td a ,
.table table  tbody  tr  td  span {
position: relative;
float: left;
padding: 6px 12px;
margin-left: -1px;
line-height: 1.42857143;
color: #337ab7;
text-decoration: none;
background-color: #fff;
border: 1px solid #ddd;
}

.table table > tbody > tr > td > span {
z-index: 3;
color: #fff;
cursor: default;
background-color: #337ab7;
border-color: #337ab7;
}

.table table > tbody > tr > td:first-child > a,
.table table > tbody > tr > td:first-child > span {
margin-left: 0;
border-top-left-radius: 4px;
border-bottom-left-radius: 4px;
}

.table table > tbody > tr > td:last-child > a,
.table table > tbody > tr > td:last-child > span {
border-top-right-radius: 4px;
border-bottom-right-radius: 4px;
}

.table table > tbody > tr > td > a:hover,
.table   table > tbody > tr > td > span:hover,
.table table > tbody > tr > td > a:focus,
.table table > tbody > tr > td > span:focus {
z-index: 2;
color: #23527c;
background-color: #eee;
border-color: #ddd;
}
/*end gridview */
    </style>
</asp:Content>

    

