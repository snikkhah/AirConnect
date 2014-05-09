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
    public partial class editProfile : System.Web.UI.Page
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
                    user.Text = "Please edit your profile " + (string)Session["first"];
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
            //        *************************
            sConnection = "Server=suavo;Database=AirConnect;Integrated Security=true;";
            dbConn = new SqlConnection(sConnection);
            dbConn.Open();
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
            errorMsg.Text = "";
            String first, last, userEmail, newPassword, confirmPass, newPoints;
            first = firstName.Text;
            if (first.Equals(""))
                first = (string)Session["first"];
            else Session["first"] = first;
            last = lastName.Text;
            if (last.Equals(""))
                last = (string)Session["last"];
            else Session["last"] = last;
            userEmail = (string)Session["EmailId"];            
            newPoints = points.Text;
            if (newPoints.Equals(""))
                newPoints = (string)Session["point"];
            else Session["point"] = newPoints;
            newPassword = password.Text;
            string sql, sFormat;
            SqlCommand dbCmd;
            SqlDataReader dbReader;
            try
            {
                if (!newPassword.Equals(""))
                {
                    confirmPass = confirmPassword.Text;
                    if (!newPassword.Equals(confirmPass))
                        errorMsg.Text = "Password miss macthed! Please try again.";
                    else
                    {
                        sFormat = "Update dbo.UserAccount Set Password = '{0}' Where EmailID = '{1}';";
                        sql = String.Format(sFormat, newPassword, userEmail);
                        dbCmd = new SqlCommand();
                        dbCmd.CommandText = sql;
                        dbCmd.Connection = dbConn;
                        dbReader = dbCmd.ExecuteReader();
                        dbReader.Close();
                        errorMsg.Text = "";
                    }
                }
                sFormat = "Update dbo.UserAccount Set FirstName = '{0}', LastName = '{1}', point = '{2}' Where EmailID = '{3}';";
                sql = String.Format(sFormat, first, last, newPoints, userEmail);
                dbCmd = new SqlCommand();
                dbCmd.CommandText = sql;
                dbCmd.Connection = dbConn;
                dbReader = dbCmd.ExecuteReader();
                dbReader.Close();
                errorMsg.Text = "";
            }
            catch (Exception err)
            {
                errorMsg.Text = err.Message;
            }

            Response.Redirect("~/profile.aspx", false);
        }
    }
}