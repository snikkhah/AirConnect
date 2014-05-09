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
    public partial class result : System.Web.UI.Page
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
                String date = (string)Session["departureDate"];
                string[] result = date.Split('/');
                int day = Convert.ToInt32(result[1]);
                string lowerRange,higherRange;
                if (day > 4)
                    lowerRange = result[0] + "/" + (day - 4) + "/" + result[2];
                else lowerRange = date;
                if (day < 27)
                    higherRange = result[0] + "/" + (day + 4) + "/" + result[2];
                else higherRange = date;
                format = "SELECT flightNo,Source,destination,FORMAT(DepartDate,'MM/dd/yyyy') AS DepartureDate, DepartTime, FORMAT(ArrivalDate, 'MM/dd/yyyy') AS ArrivalDate,ArrivalTime,Price FROM dbo.Flights WHERE Source = '{0}' AND destination = '{1}' AND DepartDate between '{2}' AND '{3}' Order by DepartureDate Asc";
                sql = String.Format(format, (string)Session["origin"], (string)Session["destination"], lowerRange, higherRange);
                SqlCommand dbCmd;
                dbCmd = new SqlCommand();
                dbCmd.CommandText = sql;
                dbCmd.Connection = dbConn;
                SqlDataAdapter adapter = new SqlDataAdapter(dbCmd);
                DataSet set = new DataSet();
                adapter.Fill(set);
                GridView1.DataSource = set;
                GridView1.DataBind();
                if (Session["roundTrip"] != null)
                    if ((Boolean)Session["roundTrip"])
                    {
                        date = (string)Session["returnDate"];
                        result = date.Split('/');
                        day = Convert.ToInt32(result[1]);
                        if (day > 4)
                            lowerRange = result[0] + "/" + (day - 4) + "/" + result[2];
                        else lowerRange = date;
                        if (day < 27)
                            higherRange = result[0] + "/" + (day + 4) + "/" + result[2];
                        else higherRange = date;
                        format = "SELECT flightNo,Source,destination,FORMAT(DepartDate,'MM/dd/yyyy') AS DepartureDate, DepartTime, FORMAT(ArrivalDate, 'MM/dd/yyyy') AS ArrivalDate,ArrivalTime,Price FROM dbo.Flights WHERE Source = '{0}' AND destination = '{1}' AND ArrivalDate between '{2}' AND '{3}' Order by ArrivalDate Asc";
                        sql = String.Format(format, (string)Session["destination"], (string)Session["origin"], lowerRange, higherRange);
                        dbCmd = new SqlCommand();
                        dbCmd.CommandText = sql;
                        dbCmd.Connection = dbConn;
                        adapter = new SqlDataAdapter(dbCmd);
                        set = new DataSet();
                        adapter.Fill(set);
                        GridView2.DataSource = set;
                        GridView2.DataBind();
                        returnTitle.Visible = true;
                    }
                //*******************************************************************************
                sql = "Select Source From dbo.Flights Order By Source Asc;";
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
            catch(Exception exp)
            {
                selectionError.Text = exp.Message;
            }
        //********************************************************
            string dest = (string)Session["destination"];
            destImage.ImageUrl = "Images/"+dest.ToLower()+".jpg";
            destText.Text = dest;
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

        protected void selection_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["roundTrip"] != null)
                    if ((Boolean)Session["roundTrip"])
                        RadioButtonTrip.SelectedIndex = 1;
                    else
                        RadioButtonTrip.SelectedIndex = 0;
                if (origin.SelectedItem != null)
                    if (!origin.SelectedItem.Text.Equals(""))
                        origin.SelectedItem.Text = (string)Session["origin"];
                if (Destination.SelectedItem != null)
                    if (!Destination.SelectedItem.Text.Equals(""))
                        Destination.SelectedItem.Text = (string)Session["destination"];
                fromDateText.Text = (string)Session["departureDate"];
                toDateText.Text = (string)Session["returnDate"];
                AdultNum.Text = (string)Session["adult"];
                ChildrenNum.Text = (string)Session["children"];
            }
            catch (Exception err)
            {
                selectionError.Text = err.Message;
            }
        }

        protected void proceed_Click(object sender, EventArgs e)
        {
            try
            {
                Boolean returnTrip = (Boolean)Session["roundTrip"];
                if (!returnTrip){
                    if (Session["toFlightNo"] != null && !((string)Session["toFlightNo"]).Equals(""))
                    {
                    Response.Redirect("~/review.aspx", false);
                    return;}
                }
                else {
                    if (Session["returnFlightNo"] != null && !((string)Session["returnFlightNo"]).Equals("") && Session["toFlightNo"] != null && !((string)Session["toFlightNo"]).Equals(""))
                    {
                        Response.Redirect("~/review.aspx", false);
                        return;}
                }
                selectionError.Text = "Please make sure you selected your desired flight(s)";
            }
            catch (Exception err)
            {
                selectionError.Text = err.Message;
            }
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string flightNo = GridView1.SelectedRow.Cells[1].Text;
                GridView1.SelectedRow.BackColor = System.Drawing.Color.DarkSeaGreen;
                Session["toFlightNo"] = flightNo;
                flight1.Text = "Selected flight number: " + flightNo;
            }
            catch (Exception err)
            {
                selectionError.Text = err.Message;
            }
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string flightNo = GridView2.SelectedRow.Cells[1].Text;
                GridView2.SelectedRow.BackColor = System.Drawing.Color.DarkSeaGreen;
                flight2.Text = "Selected flight number: " + flightNo;
                Session["returnFlightNo"] = flightNo;
            }
            catch (Exception err)
            {
                selectionError.Text = err.Message;
            }
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            Session["toFlightNo"] = false;
            Session["returnFlightNo"] = false;
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
            if (((String)Session["departureDate"]).Equals("") || ((String)Session["departureDate"]).Equals("01/01/0001")) errorText += "Please pick you departure date.\n";
            if ((RadioButtonTrip.SelectedItem.Text).Equals("Round Trip") && (((String)Session["returnDate"]).Equals("") || ((String)Session["returnDate"]).Equals("01/01/0001")))
                errorText += "Please pick you return date.\n";
            errorMsg.Text = errorText;
            if (errorText.Equals(""))
                Response.Redirect("~/result.aspx", false);
        }
    }
}