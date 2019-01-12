<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.master"  CodeFile="AddLocation1.aspx.cs" Inherits="AddLocation1" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="cphRight" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 align="center">
        LOCATION DETAILS</h2>
    
    &nbsp;&nbsp;
    <br />
    
    <table style="width: 70%;">
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            <asp:Label ID="lblLocation" runat="server" Text="Location" class="section_label"></asp:Label>
            &nbsp;ID</td>
            <td class="style1" colspan="4">
                &nbsp;
            <asp:TextBox ID="TxtlocId" runat="server" class="section_textbox" Width="189px" ></asp:TextBox>
            </td>
            <td class="auto-style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            
        <asp:Label ID="lblLocDesc" runat="server" Text="Location Description" class="section_label"></asp:Label>
            </td>
            <td colspan="4">
                &nbsp;
                <asp:TextBox ID="LOCDESC" runat="server" class="section_textbox" Width="189px" 
                    TextMode="MultiLine"></asp:TextBox>
             </td>
            <td class="auto-style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
       
        <tr>
            <td>
                &nbsp;</td>
            <td >
        <asp:Button ID="BtnSave" runat="server" Text="SAVE" Height="35px" Width="95px" OnClick="BtnSave_Click" class="buttonBlue"/>
            </td>
            <td>
        <asp:Button ID="BtnClear" runat="server"  Text="CLEAR ALL" Height="35px" Width="95px" class="buttonBlue" OnClick="BtnClear_Click"
             />


            </td>
            <td>
                <asp:Button ID="BtnUpdate" runat="server"  Text="UPDATE" 
             class="buttonBlue"  Height="35px" Width="95px" OnClick="BtnUpdate_Click" />


            </td>
            <td>
                <asp:Button ID="BtnDelete" runat="server"  Text="DELETE" 
              class="buttonBlue" Height="35px" Width="95px" OnClick="BtnDelete_Click"  />


            </td>
            <td>
                &nbsp;</td>
            <td class="auto-style2"> &nbsp;</td>
         
            <td> &nbsp;</td>
         
            <td> &nbsp;</td>
            
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtlocId"
            Display="None" ErrorMessage="  Please enter the Location ID" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>
       
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LOCDESC"
            Display="None" ErrorMessage="  Please enter the Location Description" ForeColor="Red" BorderStyle="NotSet"></asp:RequiredFieldValidator>
       
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="false"
            ShowSummary="True" HeaderText="You must enter the following" ForeColor="Red" />--%>
        </tr>
       
    </table>
    <br />
    <br />
    <br />
   <div>
<asp:GridView ID="givLocationInfo" runat="server" AutoGenerateColumns="false" Height="79px" Width="657px" style="margin-left: 6px">
<HeaderStyle BackColor=blue Font-Bold="true" ForeColor="White" />
<Columns>
<asp:BoundField DataField="LOCID" HeaderText="Location ID" />
<asp:BoundField DataField="LOCDESC" HeaderText="Location Description" />

</Columns>
</asp:GridView>
</div>
    <asp:Label ID="lblConnection" runat="server" Text="Sorry! No Connectivity" Visible="false"></asp:Label>
    <asp:Label ID="lblUserName" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .auto-style1 {
            height: 21px;
            width: 5px;
        }
        .auto-style2 {
            width: 5px;
        }
    </style>
</asp:Content>


