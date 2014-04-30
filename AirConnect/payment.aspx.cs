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
    public partial class payment : System.Web.UI.Page
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
                }
            }
            else
            {
                login.Text = "Log-in";
                signup.Visible = true;
            }
            //***********************************************************************
            try
            {
                sConnection = "Server=suavo;Database=AirConnect;Integrated Security=true;";
                dbConn = new SqlConnection(sConnection);
                dbConn.Open();
                string sql, format;
                format = "SELECT flightNo,Source,destination,FORMAT(DepartDate,'MM/dd/yyyy') AS DepartureDate, DepartTime, FORMAT(ArrivalDate, 'MM/dd/yyyy') AS ArrivalDate,ArrivalTime,Price FROM dbo.Flights WHERE flightNo = '{0}' or flightNo='{1}' Order by DepartureDate Asc";
                sql = String.Format(format, (string)Session["toFlightNo"], (string)Session["returnFlightNo"]);
                SqlCommand dbCmd;
                dbCmd = new SqlCommand();
                dbCmd.CommandText = sql;
                dbCmd.Connection = dbConn;
                SqlDataAdapter adapter = new SqlDataAdapter(dbCmd);
                SqlDataReader dbReader;
                dbReader = dbCmd.ExecuteReader();
                double sum = 0;
                while (dbReader.Read())
                {
                    TableRow row = new TableRow();
                    TableCell cell = new TableCell();
                    cell.Text = dbReader["flightNo"].ToString();
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    cell.Text = dbReader["Source"].ToString();
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    cell.Text = dbReader["destination"].ToString();
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    cell.Text = dbReader["DepartureDate"].ToString();
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    cell.Text = dbReader["DepartTime"].ToString();
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    cell.Text = dbReader["ArrivalDate"].ToString();
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    cell.Text = dbReader["ArrivalTime"].ToString();
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    string price = dbReader["Price"].ToString();
                    cell.Text = price;
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    string adult = (string)Session["adult"];
                    cell.Text = adult;
                    row.Cells.Add(cell);
                    cell = new TableCell();
                    string children = (string)Session["children"];
                    cell.Text = children;
                    row.Cells.Add(cell);
                    info.Rows.Add(row);
                    sum = sum + (Convert.ToDouble(price) * Convert.ToDouble(adult))
                        + ((Convert.ToDouble(price) / 2) * Convert.ToDouble(children));
                }
                Session["sum"] = sum;
                cost.Text = ""+sum;
                dbReader.Close();
                format = "SELECT point FROM dbo.UserAccount WHERE EmailId='{0}'";
                sql = String.Format(format, (string)Session["EmailId"]);
                dbCmd = new SqlCommand();
                dbCmd.CommandText = sql;
                dbCmd.Connection = dbConn;
                Session["point"] = balance.Text = ""+dbCmd.ExecuteScalar();
            //***********************************************************************
            }
            catch (Exception exp)
            {
                paymentError.Text = exp.Message;
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
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

        protected void pay_Click(object sender, EventArgs e)
        {
            double totalPrice = Convert.ToDouble(Session["sum"]);
            double myBalance = Convert.ToDouble(Session["point"]);
            if (totalPrice > myBalance)
            {
                paymentError.Text = "You do not have sufficient fund in your balance";
                return;
            }
            else
            {

                double newbalance = myBalance - totalPrice;
                string sql, format;
                format = "Update dbo.UserAccount Set point = {0} Where EmailId='{1}'";
                sql = String.Format(format, newbalance, (string)Session["EmailId"]);
                SqlCommand dbCmd;
                dbCmd = new SqlCommand();
                dbCmd.CommandText = sql;
                dbCmd.Connection = dbConn;
                dbCmd.ExecuteScalar();
                paymentError.Text = "Your new balance is: "+newbalance;
                balance.Text = ""+newbalance;
                pay.Visible = false;
                cancel.Visible = false;
                print.Visible = true;
                home.Visible = true;
            }
        }
        protected void print_Click(object sender, EventArgs e)
        {
            print.Visible = false; 
            Response.Redirect("~/main.aspx", false);
        }
        protected void home_Click(object sender, EventArgs e)
        {
            home.Visible = false;
            Response.Redirect("~/main.aspx", false);
        }
        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/main.aspx", false);
        }
        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/signup.aspx", false);
        }
    }
}