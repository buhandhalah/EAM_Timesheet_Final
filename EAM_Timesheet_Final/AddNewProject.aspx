<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master"  AutoEventWireup="true"
    CodeFile="AddNewProject.aspx.cs" Inherits="_Default" %>

<%--<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="cphRight" >
</asp:Content>--%>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 align="center">
        PROJECT DETAILS</h2>
    <p>

        <table style="width: 70%;">
        <tr>
            <td class="style1">
        <asp:Label ID="lblLocation" runat="server" Text="Location" class="section_label"></asp:Label></td>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

<td colspan="3">
        <asp:DropDownList ID="ddlLocation" runat="server"  class="section_textbox" 
             DataTextField="LOCDESC" DataValueField="LOCID" 
             onselectedindexchanged="ddlLocation_SelectedIndexChanged" AppendDataBoundItems="True" >
        </asp:DropDownList>
            </tr>

<td>
        &nbsp;</tr>
        <tr>
            <td class="auto-style2">
        <asp:Label ID="lblProjectNumber" runat="server" Text="Project Number" class="section_label"></asp:Label></td>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       

       <td class="auto-style2" colspan="3"> <asp:TextBox ID="TxtProjectNum" runat="server" class="section_textbox"></asp:TextBox></td>


       <td class="auto-style2"> &nbsp;</td>

        </tr>
        <tr>
            <td>
        <asp:Label ID="lblProjectName" runat="server" Text="Project Name" class="section_label"></asp:Label></td>
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
       
        <td colspan="3"> <asp:TextBox ID="TxtProjctName" runat="server" class="section_textbox" 
             TextMode="MultiLine"></asp:TextBox></td>
       
        <td> &nbsp;</td>
       </tr>
        <tr>
            <td><asp:Label ID="lblEPCompany" runat="server" Text=" EPC Company" class="section_label"></asp:Label></td>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
       <td colspan="3"> <asp:TextBox ID="TxtEpcComp" runat="server" class="section_textbox" ></asp:TextBox></td>
       
       <td> &nbsp;</td>
       </tr> 
             <tr>
        
      <td> <asp:Button ID="BtnSave" runat="server" Text="SAVE" Height="35px" Width="95px" onclick="BtnSave_Click" class="buttonBlue"  /></td> 

       <td class="auto-style7" > <asp:Button ID="BtnClear" runat="server"  Text="CLEAR ALL" 
             onclick="BtnClear_Click" Height="35px" Width="95px" class="buttonBlue"  /></td>

       <td class="auto-style6" > <asp:Button ID="BtnUpdate" runat="server"  Text="UPDATE" 
             class="buttonBlue"  Height="35px" Width="95px" OnClick="BtnUpdate_Click" /></td>

       <td class="auto-style8" > &nbsp;</td>

                 <td>
                     <asp:Button ID="BtnDelete" runat="server" Text="DELETE"
                         class="buttonBlue" Height="35px" Width="95px" OnClick="BtnDelete_Click" /></td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>

                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtProjectNum"
                     Display="None" ErrorMessage="  Please enter the Project Number" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtProjctName"
                     Display="None" ErrorMessage="  Please enter the Project Name" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtEpcComp"
                     Display="None" ErrorMessage="  Please enter the EPC company" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>

                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="false"
                     ShowSummary="True" HeaderText="You must enter the following" ForeColor="Red" />--%>
             </tr>
        </table>
    </p>
    <br />
    <br />
    <br />
   <div>
<asp:GridView ID="givProjectInfo" runat="server" AutoGenerateColumns="false" Height="79px" Width="657px" style="margin-left: 6px">
<HeaderStyle BackColor=blue Font-Bold="true" ForeColor="White" />
<Columns>
<asp:BoundField DataField="LOCDESC" HeaderText="Location Description" />
<asp:BoundField DataField="PROJNO" HeaderText="Project Number" />
<asp:BoundField DataField="PROJDESC" HeaderText="Project Name" />
<asp:BoundField DataField="EPCCOMP" HeaderText="EPC Company" />
</Columns>
</asp:GridView>
</div>
    <asp:Label ID="lblConnection" runat="server" Text="Sorry! No Connectivity" Visible="false"></asp:Label>
    <asp:Label ID="lblUserName" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style2 {
            height: 26px;
        }
        .auto-style6 {
            width: 7px;
        }
        .auto-style7 {
            width: 161px;
        }
        .auto-style8 {
            width: 23px;
        }
    </style>
</asp:Content>

