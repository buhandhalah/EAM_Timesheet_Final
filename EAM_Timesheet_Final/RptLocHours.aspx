<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RptLocHours.aspx.cs" Inherits="RptLocHours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2 align="center">
        LOCATION HOURS DETAILS</h2>
    <p>
    <div>
        <asp:GridView ID="givDisplayHours" runat="server" AutoGenerateColumns="false" Height="79px" Width="657px" style="margin-left: 6px">
<HeaderStyle BackColor=blue Font-Bold="true" ForeColor="White" />
<Columns>
<asp:BoundField DataField="LOCDESC" HeaderText="Location Description" />
<asp:BoundField DataField="WORKHRS" HeaderText="Work Hours" />
<asp:BoundField DataField="USERNAME" HeaderText="User" />
</Columns>
</asp:GridView>
    </div>
         </p> 
    <asp:Label ID="lblConnection" runat="server" Text="Sorry! No Connectivity" Visible="false"></asp:Label>
</asp:Content>


