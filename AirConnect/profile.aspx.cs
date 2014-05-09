using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AirConnect
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["validated"] != null)
            {
                if ((bool)Session["validated"])
                {
                    try
                    {
                        status.Text = "Hi " + Session["first"] + "!";
                        signup.Visible = false;
                        login.Text = "Logout";
                        email.Text = (string)Session["EmailId"];
                        firstName.Text = (string)Session["first"];
                        lastName.Text = (string)Session["last"];
                        points.Text = ""+Session["point"];
                        user.Text = "Here is your profile preview " + (string)Session["first"];
                    }
                    catch (Exception err)
                    {
                        errorMsg.Text = err.Message;
                    }
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
            }
            Session["CancelaionMsg"] = null;
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

    }
}