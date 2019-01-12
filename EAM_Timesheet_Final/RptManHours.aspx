<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="RptManHours.aspx.cs" Inherits="RptManHours" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 align="center">
        MAN HOURS DETAILS</h2>
    <p>
    <div>
     
        <asp:GridView ID="givDisplayHours" runat="server" AutoGenerateColumns="false" Height="79px" Width="657px" style="margin-left: 6px">
<HeaderStyle BackColor=blue Font-Bold="true" ForeColor="White" />
<Columns>
<asp:BoundField DataField="PROJDESC" HeaderText="Project Description" />
<asp:BoundField DataField="WORKHRS" HeaderText="Work Hours" />
<asp:BoundField DataField="USERNAME" HeaderText="User" />
</Columns>
</asp:GridView>
    </div>
         </p> 
    <asp:Label ID="lblConnection" runat="server" Text="Sorry! No Connectivity" Visible="false"></asp:Label>
</asp:Content>
