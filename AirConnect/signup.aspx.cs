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
    public partial class signup : System.Web.UI.Page
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
                    status.Text = "Hi " + Session["first"] + "!";
                    login.Visible = false;
                }
                else
                    status.Text = "Already a user?";
            }
            else
                status.Text = "Already a user?";
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx", false);
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            String user = email.Text;
            String pass = password.Text;
            String confPass = confirmPassword.Text;
            String first = firstName.Text;
            String last = lastName.Text;
            if (!pass.Equals(confPass))
            {
                errorMsg.Text = "Passwords don't match. Please try again.";
                return;
            }
            string sql, sFormat;
            sFormat = "Insert Into UserAccount(UserId,EmailId,FirstName,LastName,Password,point) Values({0}, '{1}', '{2}','{3}','{4}',{5});";
            sql = String.Format(sFormat, MaxCID()+1, user, first, last, pass, 1000);
            SqlCommand dbCmd;
            dbCmd = new SqlCommand();
            dbCmd.CommandText = sql;
            dbCmd.Connection = dbConn;
            dbCmd.ExecuteScalar();
            Session["validated"] = true;
            Session["first"] = first;
            Session["EmailId"] = user;
            Session["last"] = last;
            dbConn.Close();
            Response.Redirect("~/login.aspx", false);
        }
        protected int MaxCID()
        {
            string sql;
            sql = "Select Max(UserId) From UserAccount;";
            int cid;
            SqlCommand dbCmd;
            dbCmd = new SqlCommand();
            dbCmd.CommandText = sql;
            dbCmd.Connection = dbConn;
            cid = System.Convert.ToInt32(dbCmd.ExecuteScalar());
            return cid;
        }
    }
}