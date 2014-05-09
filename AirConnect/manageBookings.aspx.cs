using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace AirConnect
{
    public partial class managemMyBookings : System.Web.UI.Page
    {
        private String sConnection;
        private SqlConnection dbConn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["validated"] != null)
            {
                if ((bool)Session["validated"])
                {
                    status.Text = "Hi " + Session["first"] + "!";
                    signup.Visible = false;
                    login.Text = "Logout";
                }
                else
                {
                    login.Text = "Log-in";
                    signup.Visible = true;
                    Response.Redirect("~/login.aspx", false);
                    return;
                }
            }
            else
            {
                login.Text = "Log-in";
                signup.Visible = true;
                Response.Redirect("~/login.aspx", false);
                return;
            }
            if (Session["CancelaionMsg"] != null) {
                message.Text = (String)Session["CancelaionMsg"];
            }
            try
            {
                sConnection = "Server=suavo;Database=AirConnect;Integrated Security=true;";
                dbConn = new SqlConnection(sConnection);
                dbConn.Open();
                // getting Scheduled flights
                string sql, format;
                format = "SELECT Flights.flightNo,Source,destination,FORMAT(DepartDate,'MM/dd/yyyy') AS DepartureDate, DepartTime, FORMAT(ArrivalDate, 'MM/dd/yyyy') AS ArrivalDate,ArrivalTime,Price,Bookings.Adults,Bookings.Children From dbo.Flights INNER JOIN dbo.Bookings on Flights.flightNo = Bookings.FlightNo Where UserId = {0} AND History = 0;";
                sql = String.Format(format, (int)Session["UserId"]);
                SqlCommand dbCmd;
                dbCmd = new SqlCommand();
                dbCmd.CommandText = sql;
                dbCmd.Connection = dbConn;
                SqlDataAdapter adapter = new SqlDataAdapter(dbCmd);
                DataSet set = new DataSet();
                adapter.Fill(set);
                GridView1.DataSource = set;
                GridView1.DataBind();
                // getting flights from history
                format = "SELECT Flights.flightNo,Source,destination,FORMAT(DepartDate,'MM/dd/yyyy') AS DepartureDate, DepartTime, FORMAT(ArrivalDate, 'MM/dd/yyyy') AS ArrivalDate,ArrivalTime,Price,Bookings.Adults,Bookings.Children From dbo.Flights INNER JOIN dbo.Bookings on Flights.flightNo = Bookings.FlightNo Where UserId = {0} AND History = 1;";
                sql = String.Format(format, (int)Session["UserId"]);
                dbCmd = new SqlCommand();
                dbCmd.CommandText = sql;
                dbCmd.Connection = dbConn;
                adapter = new SqlDataAdapter(dbCmd);
                set = new DataSet();
                adapter.Fill(set);
                GridView2.DataSource = set;
                GridView2.DataBind();
            }
            catch (Exception err) 
            {
                message.Text = err.Message;
            }
        }
        protected void login_Click(object sender, EventArgs e)
        {
            if (login.Text.Equals("Log-in"))
                Response.Redirect("~/login.aspx", false);
            else
            {
                Session["validated"] = false;
                signup.Visible = true;
                login.Text = "Log-in";
                status.Text = "";
                Response.Redirect("~/default.aspx", false);
            }
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/signup.aspx", false);
        }
        protected void edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/editProfile.aspx", false);
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                String action = e.CommandName.ToString();
                //GridView1.SelectedIndexChanged += new EventHandler(GridView1_SelectedIndexChanged);
                int i = Convert.ToInt32(e.CommandArgument);
                String flightNo = Convert.ToString(GridView1.Rows[i].Cells[2].Text);
                string sql, format;
                SqlCommand dbCmd;
                if (action.Equals("Completed"))
                {
                    format = "Update dbo.Bookings Set History = 1 Where FlightNo = '{0}';";
                    sql = String.Format(format, flightNo);
                    dbCmd = new SqlCommand();
                    dbCmd.CommandText = sql;
                    dbCmd.Connection = dbConn;
                    dbCmd.ExecuteScalar();
                    Response.Redirect("~/manageBookings.aspx", true);
                }
                else if (action.Equals("Cancel Flight"))
                {
                    //get the price to refound
                    format = "SELECT Flights.Price,Bookings.Adults,Bookings.Children From dbo.Flights INNER JOIN dbo.Bookings on Flights.flightNo = Bookings.FlightNo Where UserId = {0} AND dbo.Bookings.FlightNo = '{1}';";
                    sql = String.Format(format, (int)Session["UserId"], flightNo);
                    dbCmd = new SqlCommand();
                    dbCmd.CommandText = sql;
                    dbCmd.Connection = dbConn;
                    SqlDataReader dbReader;
                    dbReader = dbCmd.ExecuteReader();
                    dbReader.Read();
                    double basePrice = Convert.ToDouble(dbReader["Price"].ToString());
                    int children = Convert.ToInt32(dbReader["Children"].ToString());
                    int adults = Convert.ToInt32(dbReader["Adults"].ToString());
                    double total = (basePrice * adults) + ((basePrice / 2) * children);
                    dbReader.Close();
                    // Get user's balance
                    format = "Select point From dbo.UserAccount Where UserId = '{0}';";
                    sql = String.Format(format, (int)Session["UserId"]);
                    dbCmd = new SqlCommand();
                    dbCmd.CommandText = sql;
                    dbCmd.Connection = dbConn;
                    double userPoints = Convert.ToDouble(dbCmd.ExecuteScalar().ToString());
                    // DO the calculations and put back the new amount to DB
                    double newBalance = userPoints + (total * 0.8);
                    format = "Update dbo.UserAccount Set point = {0} Where EmailId='{1}'";
                    sql = String.Format(format, newBalance, (string)Session["EmailId"]);
                    dbCmd = new SqlCommand();
                    dbCmd.CommandText = sql;
                    dbCmd.Connection = dbConn;
                    dbCmd.ExecuteScalar();
                    // Delete the booking row
                    format = "Delete From dbo.Bookings Where FlightNo = '{0}' AND UserId = {1};";
                    sql = String.Format(format, flightNo, (int)Session["UserId"]);
                    dbCmd = new SqlCommand();
                    dbCmd.CommandText = sql;
                    dbCmd.Connection = dbConn;
                    dbCmd.ExecuteScalar();
                    Session["CancelaionMsg"] = "The flight you selected(" + flightNo + ") was cannceled and the amount of " + (total * 0.8) + " was refunded to you Balance. Your New Balance is: " + newBalance;
                    Session["point"] = newBalance;
                    Response.Redirect("~/manageBookings.aspx", true);
                }
            }
            catch (Exception err)
            {
                message.Text = err.Message; 
            }
        }
    }
}