<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExamenPromerica._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="margin-top:20px;">
        <div class="form-group">
            <label for="username">Username</label>
            <asp:TextBox runat="server" class="form-control" ID="username" placeholder="Enter username"></asp:TextBox>
            <small id="usernamehelp" class="form-text text-muted">No compartiremos tu información con nadie.</small><br />
            <asp:RequiredFieldValidator ID="usernameValidator" ForeColor="Red" ErrorMessage="Por favor ingrese su usuario." ControlToValidate="username" runat="server" ></asp:RequiredFieldValidator>            
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <asp:TextBox TextMode="Password" runat="server" class="form-control" ID="password" placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="passwordValidator" ForeColor="Red" ErrorMessage="Por favor ingrese su contraseña." ControlToValidate="password" runat="server" ></asp:RequiredFieldValidator>
        </div>
        <asp:Button runat="server" Text="Login" class="btn btn-primary" OnClick="Login_Click"/>
    </div>

</asp:Content>
