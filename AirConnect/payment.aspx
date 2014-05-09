<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="AirConnect.payment" %>

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
                    <li><a href="manageBookings.aspx">ManageBooking</a></li>
					<li><a href="#about">About</a></li>
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
			<div class="jumbotron">
                <div class="panel panel-success" > 
                    <div class="panel-heading"><h4>Please proceed with the payment<span class="glyphicon glyphicon-usd pull-right"></span><span class="glyphicon glyphicon-barcode pull-right"></span></h4></div>
                        <div class="panel-body">
			            <asp:GridView ID="GridView1" class="table table-striped table-hover" runat="server" style="margin-top:10px" >
			            </asp:GridView>
                        <asp:Table ID="info" class="table table-striped" runat="server">
                            <asp:TableRow runat="server">
                                <asp:TableHeaderCell runat="server">
                                FlightNo
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server">
                                Origin
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server">
                                Destination
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server">
                                DepartureDate
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server">
                                DepartureTime
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server">
                                ArivalDate
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server">
                                ArrivalTime
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server">
                                Price
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell ID="TableCell1" runat="server">
                                Adults
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell ID="TableCell2" runat="server">
                                Children
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>
                        <div class="input-group">
                          <span class="input-group-addon">Available Balance $</span>
                          <asp:TextBox runat="server" ID="balance" type="text" name="balance" value="" class="form-control" ReadOnly="true" />
                          <span class="input-group-addon">Total Amount $</span>
                          <asp:TextBox runat="server" ID="cost" type="text" name="cost" value="" class="form-control" ReadOnly="true" />
                        </div>
                        <asp:Button Text="Pay" runat="server" class="btn btn-success pull-right" ID="pay" style="margin-top: 10px;" OnClick="pay_Click"/>
                        <asp:Button Text="Cancel" runat="server" class="btn btn-danger pull-right" ID="cancel" style="margin-top: 10px; margin-right:10px" OnClick="cancel_Click"/>
                        <asp:Button Text="Print" Visible="false" runat="server" class="btn btn-info pull-right" ID="print" style="margin-top: 10px; margin-right:10px" OnClientClick="javascript:window.print();" OnClick="print_Click"/>
                        <asp:Button Text="Home" Visible="false" runat="server" class="btn btn-success pull-right" ID="home" style="margin-top: 10px; margin-right:10px" OnClick="home_Click"/>
                        <asp:Label ID="paymentError" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </div> <!--/panel-body-->
                </div> <!--/panel-->
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
