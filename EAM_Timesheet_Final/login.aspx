<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Employee Management System</title>
<link href="Styles/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        }
        .style2
        {
            height: 34px;
        }
    </style>
    

</head>
<body class="post_background">
<form id="frmMain" runat="server">
<div class="container_wrapper">
	<div class="spacer"></div>
<div id="container">
<div id="top"></div>
  <div id="header" class="spacer">
      <div id="inner_header" class="section_box">
        <div id="site_title">EAM Timesheet Management System</div>
          <div id="site_slogan">Version 1.0</div>
      </div>
      <div id="left_column" class="section_box2">
 		<div class="text_area" align="justify">
        <center class="section_box2"><img src="images/iv-logo.jpg" /></center>
        </div>
          <div class="subtitle">Members Area</div>
    <table cellpadding="3" cellspacing="3" width="100%" border="0">
    <tr>
    <td align="center" class="style2">Username</td>
    <td align="left" class="style2"><asp:TextBox ID="txtUsername" runat="server" 
            CssClass="section_textboxlogin"></asp:TextBox></td>
    </tr>
    <tr>
    <td align="center">Password</td>
    <td align="left"><asp:TextBox ID="txtPassword" runat="server" 
            CssClass="section_textboxlogin" TextMode="Password"></asp:TextBox></td>
    </tr>
    <tr>
    <td colspan="2" align="center"><asp:Button ID="btnLogin" runat="server" CssClass="buttonBlue" Text="Login" OnClick="btnLogin_Click" /></td>
       
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
            Display="None" ErrorMessage="Please enter Username " ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
            Display="None" ErrorMessage="  Please enter Password" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="false"
            ShowSummary="True" HeaderText="You must enter the following" ForeColor="Red" />
    
    </tr>
    <tr>
    <td colspan="2" align="center" bgcolor="White" class="post_title"><asp:label ID="lblMessage" runat="server" /></td>
    </tr>
    </table>
      </div>
  </div>
  
    
	
    <div id="right_column" visible="false">
       <div >

    </div>
    <br />
    <div class="section_box2">
      <div class="subtitle">For Support and Queries</div>
        Email : <a href="mailto:mohd.badruddin@gmail.com">mohd.badruddin@gmail.com</a>
        Web : <a href="http://www.infoventures.com" target="_blank">www.InfoVentures.com</a><a 
            href="http://www.infoventures.com"></a><span class="style1">
        </span>&nbsp; Mobile : +91
    </div>
    <br />
    </div>
    <div id="footer">
    Designed and Developed by <a href="http://www.shyamsrinivas.com">
        IVQ</a></div>
</div>
<div class="spacer"></div>
</div>
</form>
</body>
</html>
