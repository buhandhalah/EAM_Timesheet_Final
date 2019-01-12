<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RptLstProj.aspx.cs" Inherits="RptLstProj" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <h2 align="center">
        LIST OF PROJECT DETAILS</h2>
    <p>
    <div>
        <asp:GridView ID="givDisplayHours" runat="server" AutoGenerateColumns="false" Height="79px" Width="657px" style="margin-left: 6px">
<HeaderStyle BackColor=blue Font-Bold="true" ForeColor="White" />
<Columns>
<asp:BoundField DataField="LOCDESC" HeaderText="Location ID" />
<asp:BoundField DataField="PROJNO" HeaderText="Project Number" />
<asp:BoundField DataField="PROJDESC" HeaderText="Project Description" />
<asp:BoundField DataField="EPCCOMP" HeaderText="EPC Company" />
</Columns>
</asp:GridView>
    </div>
         </p> 
    <asp:Label ID="lblConnection" runat="server" Text="Sorry! No Connectivity" Visible="false"></asp:Label>
</asp:Content>

