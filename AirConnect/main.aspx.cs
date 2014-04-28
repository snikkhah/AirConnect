using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirConnect
{
    public partial class main : System.Web.UI.Page
    {
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

        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/signup.aspx", false);
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
            errorMsg.Text = "";
            Session["mutiplicity"] = RadioButtonTrip.SelectedItem.Text;
            Session["origin"] = origin.SelectedItem.Text;
            Session["destination"] = Destination.SelectedItem.Text;
            Session["departureDate"] = Calendar1.SelectedDate.ToString("MM/dd/yyyy");
            Session["returnDate"] = Calendar2.SelectedDate.ToString("MM/dd/yyyy");
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
            if ((origin.SelectedItem.Text).Equals(Destination.SelectedItem.Text)) errorMsg.Text += "Origin and Destination should be different.\n";
            if ((Calendar1.SelectedDate.ToString("MM/dd/yyyy")).Equals("01/01/0001")) errorMsg.Text += "Please pick you departure date.\n";
            if ((RadioButtonTrip.SelectedItem.Text).Equals("Round Trip")&&(Calendar2.SelectedDate.ToString("MM/dd/yyyy")).Equals("01/01/0001"))
                errorMsg.Text += "Please pick you return date.\n";
        }
    }
}