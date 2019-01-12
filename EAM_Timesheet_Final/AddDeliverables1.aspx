<%@ Page Language="C#"  AutoEventWireup="true" MasterPageFile="~/Site.master"  CodeFile="AddDeliverables1.aspx.cs" Inherits="AddDeliverables1" %>

<%--<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="cphRight" >
</asp:Content>--%>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h2 align="center">
        DELIVERABLES DETAILS</h2>
    <p>
        <table style="width: 691px">
        <tr>
            <td class="style1">
                &nbsp;
        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
</td>
            <td colspan="3">
        <asp:DropDownList ID="ddlLocation" runat="server"  class="section_textbox" 
             DataTextField="LOCDESC" DataValueField="LOCID" 
             onselectedindexchanged="ddlLocation_SelectedIndexChanged" Height="16px" Width="293px" AppendDataBoundItems="True" >
        </asp:DropDownList></td>
            <td>
                &nbsp;</td></tr>
     <tr>
            <td>
        <asp:Label ID="lblDelNumber" runat="server" Text="Deliverable Number" class="section_label"></asp:Label></td>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <td colspan="3"> <asp:TextBox ID="TxtDelNum" runat="server" class="section_textbox"></asp:TextBox></td>

       <td> &nbsp;</td>

        </tr>   
            <tr>    
<td>
        <asp:Label ID="lblDelDesc" runat="server" Text="Deliverable Description"></asp:Label>
            </td>

      <td colspan="3" >

          <asp:TextBox ID="txtDelDesc" runat="server" TextMode="MultiLine" class="section_textbox" Height="89px" Width="278px"></asp:TextBox><br />
        <br /></td>

      <td >

          &nbsp;</td>
</tr>
    <tr>
        
    <td><asp:Button ID="BtnSave" runat="server" Text="SAVE" onclick="BtnSave_Click" class="buttonBlue"  Height="35px" Width="95px"/></td>
        
       <td> <asp:Button ID="BtnClear" runat="server"  Text="CLEAR ALL" 
             onclick="BtnClear_Click" class="buttonBlue"  Height="35px" Width="95px"  /></td>
        
       <td class="auto-style2"> <asp:Button ID="BtnUpdate" runat="server"  Text="UPDATE" 
             class="buttonBlue"  Height="35px" Width="95px" OnClick="BtnUpdate_Click" /></td>
        
       <td class="auto-style1"> &nbsp;</td>
        
       <td> <asp:Button ID="BtnDelete" runat="server"  Text="DELETE" 
              class="buttonBlue" Height="35px" Width="95px" OnClick="BtnDelete_Click"  /></td>
         <td> &nbsp;</td>
         <td> &nbsp;</td>

       <%-- <asp:RequiredFieldValidator ID="val1" runat="server" ControlToValidate="TxtDelNum"
            Display="None" ErrorMessage="  Please enter the Delivery Number" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>
       
         <asp:RequiredFieldValidator ID="val2" runat="server" ControlToValidate="txtDelDesc"
            Display="None" ErrorMessage="  Please enter the Delivery Description" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>
        
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="false"
            ShowSummary="True" HeaderText="You must enter the following" ForeColor="Red" />--%>
    </tr>
        </table>
    </p>
     <br />
    <br />
    <br />
   <div>
<asp:GridView ID="givDeliverablesInfo" runat="server" AutoGenerateColumns="false" Height="79px" Width="657px" style="margin-left: 6px">
<HeaderStyle BackColor=blue Font-Bold="true" ForeColor="White" />
<Columns>
<asp:BoundField DataField="LOCDESC" HeaderText="Location Description" />
<asp:BoundField DataField="DELNO" HeaderText="Deliverables Number" />
<asp:BoundField DataField="DELDESC" HeaderText="Deliverables Description" />
</Columns>
</asp:GridView>
</div>
    <asp:Label ID="lblConnection" runat="server" Text="Sorry! No Connectivity" Visible="false"></asp:Label>
    <asp:Label ID="lblUserName" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>


<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 33px;
        }
        .auto-style2 {
            width: 40px;
        }
    </style>
    </asp:Content>



