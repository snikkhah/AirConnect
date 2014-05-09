<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AirConnect.Default" %>

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
                <li class="active"><a href="Default.aspx">Home</a></li>
				<li><a href="main.aspx">Main</a></li>
				<li><a href="#about">About</a></li>
				<li><asp:Label Text="" ForeColor="Red" ID="lblTest" runat="server" /></li>
              </ul>
                <ul class="nav navbar-nav pull-right">
                    <a href="profile.aspx"><asp:Label Text="" ForeColor="GrayText" Font-Size="Large" ID="status" runat="server" /></a>
                    <asp:Button Text="Log-in" runat="server" class="btn btn-success" ID="login" OnClick="login_Click" style="margin-top: 10px;" />
                    <asp:Button Text="Sign-up" runat="server" class="btn btn-primary" ID="signup" OnClick="signup_Click" style="margin-top: 10px;" />
                </ul>
            </div><!-- /.nav-collapse -->
          </div><!-- /.container -->
        </div><!-- /.navbar -->  
        <hr>
        <hr>
    <div class="container">
        <div class="jumbotron" style="background:rgba(255,255,255,0.5);">
          <div class="row row-offcanvas row-offcanvas-right">
            <div>
              <p class="pull-right visible-xs">
                <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
              </p>
                <h2 style="color:darkblue;" align="middle"><b>AirConnect welcomes you to our webservice.</b></h2>
                <h3 style="color:darkblue;" align="middle">Airconnect is flight booking portal where booking can't get any easier.</h3>
                <img src="Images/travel-agents.jpg" class="img-responsive img-rounded" alt="Responsive image">
                <a href="main.aspx">
                 <img src="Images/airplane_takeoff-.png" width="100" style="display:block;margin-left:auto;margin-right:auto;">
                </a>
            </div><!--/span-->   
          </div><!--/row-->
    <!--      <hr>  -->
         </div>
    </div><!--/.container-->     
      <footer>
         <asp:Label Text="&copy; Company 2014" ForeColor="White" runat="server" />
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
