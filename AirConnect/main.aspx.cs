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
    public partial class main : System.Web.UI.Page
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
            Session["CancelaionMsg"] = null;
            if (origin.Items.Count == 0)
            {
                try
                {
                    sConnection = "Server=suavo;Database=AirConnect;Integrated Security=true;";
                    dbConn = new SqlConnection(sConnection);
                    dbConn.Open();
                    string sql = "Select Source From dbo.Flights Order By Source Asc;";
                    SqlCommand dbCmd;
                    dbCmd = new SqlCommand();
                    dbCmd.CommandText = sql;
                    dbCmd.Connection = dbConn;
                    SqlDataReader dbReader;
                    dbReader = dbCmd.ExecuteReader();
                    int i = 0;
                    while (dbReader.Read())
                    {
                        if (origin.Items.FindByText(dbReader["Source"].ToString()) == null)
                        {
                            origin.Items.Add(new ListItem(dbReader["Source"].ToString(), "" + i));
                            i++;
                        }
                    }
                    dbReader.Close();
                    sql = "Select destination From dbo.Flights Order By Source Asc;";
                    dbCmd.CommandText = sql;
                    dbReader = dbCmd.ExecuteReader();
                    i = 0;
                    while (dbReader.Read())
                    {
                        if (Destination.Items.FindByText(dbReader["destination"].ToString()) == null)
                        {
                            Destination.Items.Add(new ListItem(dbReader["destination"].ToString(), "" + i));
                            i++;
                        }
                    }
                }
                catch (Exception err)
                {
                    errorMsg.Text = err.Message;
                }
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

        protected void checkFlight1_Click(object sender, EventArgs e)
        {
            Session["roundTrip"] = true;
            Session["origin"] = "San Jose";
            Session["destination"] = "San Francisco";
            Session["departureDate"] = DateTime.Now.ToString();
            Session["returnDate"] = DateTime.Now.ToString();
            Session["adult"] = "1";
            Session["children"] = "0";
            Response.Redirect("~/result.aspx", false);
        }

        protected void checkFlight2_Click(object sender, EventArgs e)
        {
            Session["roundTrip"] = true;
            Session["origin"] = "San Jose";
            Session["destination"] = "Denver";
            Session["departureDate"] = DateTime.Now.ToString();
            Session["returnDate"] = DateTime.Now.ToString();
            Session["adult"] = "1";
            Session["children"] = "0";
            Response.Redirect("~/result.aspx", false);
        }

        protected void checkFlight3_Click(object sender, EventArgs e)
        {
            Session["roundTrip"] = true;
            Session["origin"] = "San Jose";
            Session["destination"] = "Florida";
            Session["departureDate"] = DateTime.Now.ToString();
            Session["returnDate"] = DateTime.Now.ToString();
            Session["adult"] = "1";
            Session["children"] = "0";
            Response.Redirect("~/result.aspx", false);
        }

        protected void checkFlight4_Click(object sender, EventArgs e)
        {
            Session["roundTrip"] = true;
            Session["origin"] = "San Jose";
            Session["destination"] = "Hawaii";
            Session["departureDate"] = DateTime.Now.ToString();
            Session["returnDate"] = DateTime.Now.ToString();
            Session["adult"] = "1";
            Session["children"] = "0";
            Response.Redirect("~/result.aspx", false);
        }

        protected void checkFlight5_Click(object sender, EventArgs e)
        {
            Session["roundTrip"] = true;
            Session["origin"] = "San Jose";
            Session["destination"] = "Miami";
            Session["departureDate"] = DateTime.Now.ToString();
            Session["returnDate"] = DateTime.Now.ToString();
            Session["adult"] = "1";
            Session["children"] = "0";
            Response.Redirect("~/result.aspx", false);
        }

        protected void checkFlight6_Click(object sender, EventArgs e)
        {
            Session["roundTrip"] = true;
            Session["origin"] = "San Jose";
            Session["destination"] = "Key West";
            Session["departureDate"] = DateTime.Now.ToString();
            Session["returnDate"] = DateTime.Now.ToString();
            Session["adult"] = "1";
            Session["children"] = "0";
            Response.Redirect("~/result.aspx", false);
        }

        protected void origin_changed(object sender, EventArgs e)
        {
            Session["origin"] = origin.SelectedItem.Text;
        }
        protected void destination_changed(object sender, EventArgs e)
        {
            Session["destination"] = Destination.SelectedItem.Text;
        }
        
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            fromDateText.Text = "" + Calendar1.SelectedDate.ToString("MM/dd/yyyy");
            Calendar1.Visible = false;
        }

        protected void pickCalendar1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void pickCalendar2_Click(object sender, EventArgs e)
        {
            if (RadioButtonTrip.SelectedItem.Text.Equals("Round Trip"))
            Calendar2.Visible = true;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            toDateText.Text = "" + Calendar2.SelectedDate.ToString("MM/dd/yyyy");
            Calendar2.Visible = false;
        }

        protected void RadioButtonTrip_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            String errorText = "";
            errorMsg.Text = errorText;
            if (RadioButtonTrip.SelectedItem.Text.Equals("Round Trip"))
                Session["roundTrip"] = true;
            else Session["roundTrip"] = false;
            Session["origin"] = origin.SelectedItem.Text;
            Session["destination"] = Destination.SelectedItem.Text;
            Session["departureDate"] = fromDateText.Text;
            if (RadioButtonTrip.SelectedItem.Text.Equals("Round Trip"))
                Session["returnDate"] = toDateText.Text;
            else Session["returnDate"] = "";
            String count = AdultNum.Text;
            if (count.Equals(""))
            {
                count = "1";
                AdultNum.Text = "1";
            }
            Session["adult"] = count;
            count = ChildrenNum.Text;
            if (count.Equals(""))
            {
                count = "0";
                ChildrenNum.Text = "0";
            }
            Session["children"] = count;
            if ((origin.SelectedItem.Text).Equals(Destination.SelectedItem.Text)) errorText += "Origin and Destination should be different.\n";
            if (((Calendar1.SelectedDate.ToString("MM/dd/yyyy")).Equals("01/01/0001")) || ((String)Session["departureDate"]).Equals("01/01/0001")) errorText += "Please pick you departure date.\n";
            if ((RadioButtonTrip.SelectedItem.Text).Equals("Round Trip") && (((String)Session["returnDate"]).Equals("") || ((String)Session["returnDate"]).Equals("01/01/0001")))
                errorText += "Please pick you return date.\n";
            errorMsg.Text = errorText;
            if (errorText.Equals(""))
                Response.Redirect("~/result.aspx", false);
        }
    }
}