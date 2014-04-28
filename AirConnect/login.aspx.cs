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
    public partial class login : System.Web.UI.Page
    {
        private String sConnection;
        private SqlConnection dbConn;
        protected void Page_Load(object sender, EventArgs e)
        {
            sConnection = "Server=suavo;Database=AirConnect;Integrated Security=true;";
            dbConn = new SqlConnection(sConnection);
            dbConn.Open();
            if (Session["validated"] != null)
            {
                if ((bool)Session["validated"])
                {
                    status.Text = status.Text = "Hi " + Session["first"] + "!";
                    signup.Visible = false;
                }
                else
                    status.Text = "New user?";
            }
            else
                status.Text = "New user?";
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/signup.aspx", false);
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            String user = email.Text;
            String pass = password.Text;
            string sql, sFormat;
            sFormat = "Select Password From dbo.UserAccount Where EmailId='{0}';";
            sql = String.Format(sFormat, user);
            SqlCommand dbCmd;
            dbCmd = new SqlCommand();
            dbCmd.CommandText = sql;
            dbCmd.Connection = dbConn;
            String dbpass = "";
            try
            {
                dbpass = (String)dbCmd.ExecuteScalar();
                if (dbpass.Equals(pass))
                {
                    Session["validated"] = true;
                    errorMsg.Text = "";
                    Session["first"] = user;
                    Response.Redirect("~/main.aspx", false);
                }
                else
                {
                    errorMsg.Text = "Wrong Username or Password";
                    Session["validated"] = false;
//                   ((Literal)login1.FindControl("FailureText")).Text = "Your login attempt was not successful. Please try again.";
                }
            }
            catch (Exception) { }
        }
    }
}