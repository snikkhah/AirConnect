<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageBookings.aspx.cs" Inherits="AirConnect.managemMyBookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
	<body style="background:#123;">
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
                    <li class="active"><a href="manageBookings.aspx">ManageBooking</a></li>
                    <li><a href="#about">About</a></li>
				  </ul>
					<ul class="nav navbar-nav pull-right">
                         <a href="profile.aspx"><asp:Label Text="" ForeColor="GrayText" Font-Size="Large" ID="status" runat="server"></asp:Label></a>
						<asp:Button Text="Log-in" runat="server" class="btn btn-success" ID="login" OnClick="login_Click" style="margin-top: 10px;" />
						<asp:Button Text="Sign-up" runat="server" class="btn btn-primary" ID="signup" OnClick="signup_Click" style="margin-top: 10px;" />
					</ul>
				</div><!-- /.nav-collapse -->
			  </div><!-- /.container -->
			</div><!-- /.navbar -->  
			<hr>
			<hr>
		<div class="container">
			<div class="jumbotron">
                <div class="panel panel-success" > 
                    <div class="panel-heading"><h4><asp:Label runat="server">Scheduled Flights</asp:Label><span class="glyphicon glyphicon-plane pull-right"></span></h4></div>
                        <div class="panel-body">
                            <asp:GridView ID="GridView1" class="table table-striped table-hover" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" style="margin-top:10px" >
                                <Columns><asp:ButtonField Text="Completed" CommandName="Completed" ItemStyle-Width="30"  /></Columns>
                                <Columns><asp:ButtonField Text="Cancel Flight" CommandName="Cancel Flight" ItemStyle-Width="30"  /></Columns>
                            </asp:GridView> 
                            <asp:Label runat="server" ForeColor="Red" ID="message"/>
                        </div> <!--/panel-body-->
                </div> <!--/panel-->
                <div class="panel panel-success" > 
                    <div class="panel-heading"><h4><asp:Label ID="Label2" runat="server">Flights from History</asp:Label>
                        <span class="glyphicon glyphicon-header pull-right"></span><span class="glyphicon glyphicon-floppy-save pull-right"></h4></div>
                        <div class="panel-body">
                            <asp:GridView ID="GridView2" class="table table-striped table-hover" runat="server" style="margin-top:10px" ></asp:GridView>
                        </div> <!--/panel-body-->
                </div> <!--/panel-->
                <a href="main.aspx" class="btn btn-info">Return</a>
                <p><h5>Note: In case of canceling a flight only 80% of the full amount will be refunded to you account.</h5></p>
		    </div>	 <!--/.jumbotron-->
		</div><!--/.container-->     
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
