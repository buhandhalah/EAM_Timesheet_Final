<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports1.aspx.cs" MasterPageFile="~/Site.master" Inherits="Reports1" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="cphRight" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 align="center" class="style1">
        REPORT DETAILS</h2>
    <p align="center">
        <asp:Button ID="BtnActivity" runat="server" Text="Project wise User Activity" 
            CssClass="buttonsize" onclick="BtnActivity_Click" />
        <br />
        <br />
        <asp:Button ID="BtnLocHours" runat="server" Text="Location wise Man Hours" CssClass="buttonsize" OnClick="BtnLocHours_Click"/>
        <br />
        <br />
        <asp:Button ID="BtnProjHours" runat="server" Text="Project wise Man Hours" CssClass="buttonsize" OnClick="BtnProjHours_Click"/>
        <br />
        <br />
        <asp:Button ID="BtnListProj" runat="server" Text="List of Projects - Location wise" CssClass="buttonsize" OnClick="BtnListProj_Click"/>
        <br />
        <br />
        <asp:Button ID="BtnListDel" runat="server" Text="Deliverables List - Location Wise" CssClass="buttonsize" OnClick="BtnListDel_Click" />
        <br />
        <br />
        

</p>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .style1
        {
            margin-left: 60px;
        }
    </style>
</asp:Content>
