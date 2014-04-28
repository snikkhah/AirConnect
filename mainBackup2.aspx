<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="AirConnect.main" %>

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
					<li class="active"><a href="main.aspx">Main</a></li>
					<li><a href="#about">About</a></li>
					<li><asp:Label Text="" ForeColor="Red" ID="lblTest" runat="server" /></li>
				  </ul>
					<ul class="nav navbar-nav pull-right">
						<asp:Button Text="Log-in" runat="server" class="btn btn-success" ID="login" OnClick="login_Click" style="margin-top: 10px;" />
						<asp:Button Text="Sign-up" runat="server" class="btn btn-primary" ID="signup" OnClick="signup_Click" style="margin-top: 10px; height: 29px;" />
					</ul>
				</div><!-- /.nav-collapse -->
			  </div><!-- /.container -->
			</div><!-- /.navbar -->  
			<hr>
			<hr>
		<div class="container">
			<div class="jumbotron">
			  <div class="row row-offcanvas row-offcanvas-right">
				<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				  <div class="list-group">
					<a href="#" class="list-group-item active">Search</a>
					<a href="#" class="list-group-item">Manage My Flights</a>
				  </div>
				</div><!--/span-->
				<div class="col-xs-12 col-sm-9">
				  <p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
                        <div class="row row-offcanvas row-offcanvas-right">
				            <div class="col-xs-9 col-sm-6 sidebar-offcanvas" id="Div1" role="navigation">
				                <div class="input-group">
                                    <span class="input-group-addon">
                                        <asp:CheckBox runat="server" ID="onewayCheck" type="checkbox"/>
                                    </span>
                                    <input type="text" class="form-control" value="Oneway" readonly="true">
                                </div>
                                <div class="input-group" style="margin-top:10px">
                                  <input type="text" class="form-control" value="Choose the city you depart" readonly="true">
                                  <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">From<span class="caret"></span></button>
                                    <ul class="dropdown-menu pull-right">
                                      <li><a href="#">California</a></li>
                                      <li><a href="#">South Dakota</a></li>
                                      <li><a href="#">New Jersy</a></li>
                                      <li class="divider"></li>
                                      <li><a href="#">Key West</a></li>
                                    </ul>
                                  </div><!-- /btn-group -->
                                </div><!-- /input-group -->
                                <div class="input-group" style="margin-top:10px">
                                  <asp:TextBox runat="server" ID="fromDateText" type="text" placeholder="Click on Pick to view calendar" class="form-control"/>   
                                  <span class="input-group-btn">
                                    <asp:Button runat="server" ID="pickCalendar1" class="btn btn-default" Text="Pick" type="button" OnClick="pickCalendar1_Click"/>
                                  </span>
                                </div><!-- /input-group -->
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="#E6D7B8" Visible="false" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                                <div class="input-group" style="margin-top:10px">
                                <span class="input-group-addon">Adults</span>
				                <asp:TextBox runat="server" class="form-control" ID="AdultNum" type="text" name="AdultNum" placeholder="Number of Adults" value=""/>
                                </div>
				            </div><!--/span-->
				            <div class="col-xs-9 col-sm-6">
				                <div class="input-group">
                                    <span class="input-group-addon">
                                        <asp:CheckBox runat="server" ID="roundTripCheck" type="checkbox"/>
                                    </span>
                                    <input type="text" class="form-control" value="Round Trip" readonly="true">
                                </div>
                                <div class="input-group" style="margin-top:10px">
                                  <input type="text" class="form-control" value="Choose the city you land" readonly="true">
                                  <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">To<span class="caret"></span></button>  
                                    <ul class="dropdown-menu pull-right">                                                                 
                                      <li><a href="#">South Dakota</a></li>
                                      <li><a href="#">New Jersy</a></li>
                                      <li class="divider"></li>
                                      <li><a href="#">Key West</a></li>
                                    </ul>
                                  </div><!-- /btn-group -->
                                </div><!-- /input-group -->
                                <div class="input-group" style="margin-top:10px">
                                  <asp:TextBox runat="server" ID="toDateText" type="text" placeholder="Click on Pick to view calendar" class="form-control"/>   
                                  <span class="input-group-btn">
                                    <asp:Button ID="pickCalendar2" runat="server" class="btn btn-default" Text="Pick" type="button" OnClick="pickCalendar2_Click" />
                                  </span>
                                </div><!-- /input-group -->
                                <asp:Calendar ID="Calendar2" runat="server" Visible="false" BackColor="#E6D7B8" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
                                <div class="input-group" style="margin-top:10px">
                                <span class="input-group-addon">Children</span>
				                <asp:TextBox runat="server" class="form-control" ID="ChildrenNum" type="text" name="ChildrenNum" placeholder="Number of Children" value=""/>
                                </div>
                                <asp:Button Text="Search" runat="server" class="btn btn-success pull-right" ID="Search" style="margin-top: 10px;" />
				            </div><!--/span-->   
			            </div><!--/row-->
				  </p>
				</div><!--/span-->   
			  </div><!--/row-->
			  <hr>
			 </div>
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
