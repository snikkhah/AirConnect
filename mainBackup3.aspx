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
						<asp:Button Text="Sign-up" runat="server" class="btn btn-primary" ID="signup" OnClick="signup_Click" style="margin-top: 10px;" />
					</ul>
				</div><!-- /.nav-collapse -->
			  </div><!-- /.container -->
			</div><!-- /.navbar -->  
			<hr>
			<hr>
		<div class="container-fluid">
			<div class="jumbotron">
			  <div class="row row-offcanvas row-offcanvas-right">
				<div class="col-xs-6 col-sm-3 sidebar-offcanvas panel panel-default" id="sidebar" role="navigation" >
				  <div class="panel panel-success" style="margin-top:20px"> 
                      <div class="panel-heading">Panel heading without title</div>
                      <div class="panel-body">
                    <div class="row row-offcanvas row-offcanvas-right">
				            <div class="col-xs-9 col-sm-6 sidebar-offcanvas" id="Div1" role="navigation">
				                <div class="input-group">
                                    <span class="input-group-addon">
                                        <asp:CheckBox runat="server" ID="onewayCheck" type="checkbox"/>
                                    </span>
                                    <input type="text" class="form-control" value="Oneway" readonly="true">
                                </div>
                                <div class="input-group" style="margin-top:10px">
                                  <input type="text" class="form-control" value="Choose the city" readonly="true">
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
                                  <asp:TextBox runat="server" ID="fromDateText" type="text" placeholder="Click on Pick" class="form-control"/>   
                                  <span class="input-group-btn">
                                    <asp:Button runat="server" ID="pickCalendar1" class="btn btn-default" Text="Pick" type="button" OnClick="pickCalendar1_Click"/>
                                  </span>
                                </div><!-- /input-group -->
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="#E6D7B8" Visible="false" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                                <div class="input-group" style="margin-top:10px">
                                <span class="input-group-addon">Adults</span>
				                <asp:TextBox runat="server" class="form-control" ID="AdultNum" type="text" name="AdultNum" placeholder="#" value=""/>
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
                                  <input type="text" class="form-control" value="Choose the city" readonly="true">
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
                                  <asp:TextBox runat="server" ID="toDateText" type="text" placeholder="Click on Pick" class="form-control"/>   
                                  <span class="input-group-btn">
                                    <asp:Button ID="pickCalendar2" runat="server" class="btn btn-default" Text="Pick" type="button" OnClick="pickCalendar2_Click" />
                                  </span>
                                </div><!-- /input-group -->
                                <asp:Calendar ID="Calendar2" runat="server" Visible="false" BackColor="#E6D7B8" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
                                <div class="input-group" style="margin-top:10px">
                                <span class="input-group-addon">Children</span>
				                <asp:TextBox runat="server" class="form-control" ID="ChildrenNum" type="text" name="ChildrenNum" placeholder="#" value=""/>
                                </div>
                                <asp:Button Text="Search" runat="server" class="btn btn-success pull-right" ID="Search" style="margin-top: 10px;" />
				            </div><!--/span-->   
			            </div><!--/row-->
                    </div><!--/panel Body-->
                </div><!--/panel-->
				</div><!--/span-->
				<div class="col-xs-12 col-sm-9">
				  <p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>   
				  </p>
                    <div class="row row-offcanvas row-offcanvas-right" style="margin-left:80px;">
				        <div class="col-xs-5 col-sm-3 sidebar-offcanvas panel panel-default" id="Div2" role="navigation" style="margin:5px">
                            <div class="thumbnail" style="margin-top: 10px;">
                              <img src="Images/Pattaya.jpg" class="img-responsive img-rounded" alt="Thailand">
                              <div class="caption">
                                <h3>Thailand</h3>
                                <p>Check out these exotic destinations</p>
                              </div>
                            </div>
                            <div class="thumbnail" style="margin-top: 10px;">
                              <img src="Images/malaysia11.jpg" class="img-responsive img-rounded" alt="Malaysia">
                              <div class="caption">
                                <h3>Malaysia</h3>
                                <p>Check out these exotic destinations</p>
                              </div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-sm-3 sidebar-offcanvas panel panel-default" id="Div3" role="navigation" style="margin:5px">
                            <div class="thumbnail" style="margin-top: 10px;">
                              <img src="Images/Florida.jpg" class="img-responsive img-rounded" alt="Florida">
                              <div class="caption">
                                <h3>Florida</h3>
                                <p>Check out these exotic destinations</p>
                              </div>
                            </div>
                            <div class="thumbnail" style="margin-top: 10px;">
                              <img src="Images/hawaii.jpg" class="img-responsive img-rounded" alt="Hawaii">
                              <div class="caption">
                                <h3>Hawaii</h3>
                                <p>Check out these exotic destinations</p>
                              </div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-sm-3 sidebar-offcanvas panel panel-default" id="Div4" role="navigation" style="margin:5px">
                            <div class="thumbnail" style="margin-top: 10px;">
                              <img src="Images/miami.jpg" class="img-responsive img-rounded" alt="Miami">
                              <div class="caption">
                                <h3>Miami</h3>
                                <p>Check out these exotic destinations</p>
                              </div>
                            </div>
                            <div class="thumbnail" style="margin-top: 10px;">
                              <img src="Images/KeyWest3.jpg" class="img-responsive img-rounded" alt="KeyWest">
                              <div class="caption">
                                <h3>Key West</h3>
                                <p>Check out these exotic destinations</p>
                              </div>
                            </div>
                        </div>
                    </div> <!--/row thumbnail-->
				</div><!--/span-->   
			  </div><!--/row-->
			  <hr>
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
