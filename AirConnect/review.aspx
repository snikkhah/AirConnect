<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="review.aspx.cs" Inherits="AirConnect.review" %>

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
					<li class="active"><a href="main.aspx">Main</a></li>
					<li><a href="#about">About</a></li>
				  </ul>
					<ul class="nav navbar-nav pull-right">
                        <asp:Label Text="" ForeColor="GrayText" Font-Size="Large" ID="status" runat="server" />
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
                      <div class="panel-heading"><h4>Please select your search criteria</h4></div>
                      <div class="panel-body">
                          <asp:RadioButtonList id="RadioButtonTrip" runat="server" RepeatDirection="Horizontal" Width="182px">
                            <asp:ListItem Selected="True">Oneway</asp:ListItem>
                            <asp:ListItem>Round Trip</asp:ListItem>
                         </asp:RadioButtonList>
                    <div class="row row-offcanvas row-offcanvas-right">
				            <div class="col-xs-9 col-sm-6 sidebar-offcanvas" id="Div1" role="navigation">			                
                                <asp:DropDownList backColor="White" ID="origin" runat="server" AutoPostBack="True" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="margin-top:10px" Width="182px"/>
                                <div class="input-group" style="margin-top:10px">
                                  <asp:TextBox runat="server" ID="fromDateText" type="text" placeholder="Click on Pick" class="form-control"/>   
                                  <span class="input-group-btn">
                                    <asp:Button runat="server" ID="pickCalendar1" class="btn btn-default" Text="Pick" type="button" OnClick="pickCalendar1_Click"/>
                                  </span>
                                </div><!-- /input-group -->
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="#D0F5AE" Visible="false" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                                <div class="input-group" style="margin-top:10px">
                                <span class="input-group-addon">Adults</span>
				                <asp:TextBox runat="server" class="form-control" ID="AdultNum" type="text" name="AdultNum" placeholder="#" value=""/>
                                </div>
                                 <asp:Button Text="My Selections" runat="server" class="btn btn-info pull-left" ID="selections" style="margin-top: 10px;" OnClick="selection_Click"/>
				            </div><!--/span-->
				            <div class="col-xs-9 col-sm-6">
                                <asp:DropDownList ID="Destination" backColor="White" runat="server" AutoPostBack="True" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="margin-top:10px" Width="182px"/>
                                <div class="input-group" style="margin-top:10px">
                                    <asp:TextBox runat="server" ID="toDateText" type="text" placeholder="Click on Pick" class="form-control" />   
                                  <span class="input-group-btn">
                                    <asp:Button ID="pickCalendar2" runat="server" class="btn btn-default" Text="Pick" type="button" OnClick="pickCalendar2_Click" />
                                  </span>
                                </div><!-- /input-group -->
                                <asp:Calendar ID="Calendar2" runat="server" Visible="false" BackColor="#D0F5AE" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
                                <div class="input-group" style="margin-top:10px">
                                <span class="input-group-addon">Children</span>
				                <asp:TextBox runat="server" class="form-control" ID="ChildrenNum" type="text" name="ChildrenNum" placeholder="#" value=""/>
                                </div>
                                <asp:Button Text="Search" runat="server" class="btn btn-success pull-right" ID="Search" style="margin-top: 10px;" OnClick="Search_Click"/>
				            </div><!--/span-->   
			        </div><!--/row-->
                          <li><asp:Label Text="" ForeColor="Red" ID="errorMsg" runat="server" /></li>
                    </div><!--/panel Body-->
                </div><!--/panel-->
                    <div class="thumbnail" style="margin-top: 10px;">
                        <asp:Image runat="server" ID="destImage" ImageUrl="Images/miami.jpg" class="img-responsive img-rounded" alt="Miami"/>
                        <div class="caption">
                        <asp:Label runat="server" ID="destText" Font-Size="X-Large"/>
                        Check out these exotic destinations
                        </div>
                    </div>
				</div><!--/span-->
				<div class="col-xs-12 col-sm-9">
				  <p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>   
				  </p>
                    <div class="panel panel-success" > 
                      <div class="panel-heading"><h4>Please confirm your flight</h4></div>
                         <div class="panel-body">
                        <asp:GridView ID="GridView1" class="table table-striped table-hover" runat="server" style="margin-top:10px" ></asp:GridView>
                        <asp:Label ID="flight1" runat="server" Text=""></asp:Label>
                        <asp:GridView ID="GridView2" class="table table-striped table-hover" runat="server" style="margin-top:10px" ></asp:GridView>
                        <asp:Label ID="flight2" runat="server" Text=""></asp:Label>
                        <asp:Button Text="Confirm" runat="server" class="btn btn-success pull-right" ID="confirm" style="margin-top: 10px;" OnClick="confirm_Click"/>
                        <asp:Button Text="Cancel" runat="server" class="btn btn-danger pull-right" ID="cancel" style="margin-top: 10px; margin-right:10px" OnClick="cancel_Click"/>
                        <asp:Label ID="selectionError" runat="server" Text=""></asp:Label>
                        </div> <!--/panel-body-->
                    </div> <!--/panel-->
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