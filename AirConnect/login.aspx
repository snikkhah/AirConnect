﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AirConnect.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>AirConnect</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
</head>
<body style="background:url(Images/back1.jpg);">
    <form id="form1" runat="server">
        <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">Welcome to AirConnect</a>
            </div>
            <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="Default.aspx">Home</a></li>
				<li><a href="main.aspx">Main</a></li>
				<li><a href="#about">About</a></li>
              </ul>
                <div class="navbar-collapse collapse">
                    <asp:Button Text="Sign-up" runat="server" class="btn btn-primary navbar-btn navbar-right" ID="signup" OnClick="signup_Click" style="margin-top: 10px;" />
                    <asp:Label runat="server" ID="status" class="navbar-text navbar-right" ForeColor="GrayText" style="margin-right: 10px;"></asp:Label>
                </div>
            </div><!-- /.nav-collapse -->
          </div><!-- /.container -->
        </div><!-- /.navbar -->  
        <hr>
        <hr>
     <div class="container">
                <div class="jumbotron" style="background:rgba(255,255,255,0.8);">
				    <h2>Login</h2>
				    <form method="post">
				      <table class="table table-hover">
				        <tr>
                                <div class="input-group">
                                <span class="input-group-addon">Email</span>
				                <asp:TextBox runat="server" class="form-control" ID="email" type="text" name="email" placeholder="Please enter your Email" value=""/>
                                </div>
				        </tr>
				        <tr>
                                <div class="input-group">
                                <span class="input-group-addon">Password</span>
                                <asp:TextBox runat="server" class="form-control" ID="password" type="password" name="password" placeholder="Please enter your Password" value=""/>
                                </div>
				        </tr>
					</table>
<!--				      <input type="submit">  -->
				    </form>
				    <asp:Label Text="" ForeColor="Red" ID="errorMsg" runat="server" />
				    <asp:Button runat="server" ID="loginButton" Text="Login" class="btn btn-primary" OnClick="loginButton_Click"/>
                    <!-- calls getBooks() from HomeResource -->
                </div>
            </div> <!-- end of container -->     
      <footer>
         <asp:Label ID="Label1" Text="&copy; Company 2014" ForeColor="White" runat="server" />
      </footer>
    </form>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="offcanvas.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>
