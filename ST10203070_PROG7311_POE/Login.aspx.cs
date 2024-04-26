using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10203070_PROG7311_POE
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (YourAuthenticationMethod(Username.Text, Password.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(Username.Text, false);
            }
            else
            {
                ErrorMessage.Text = "Invalid username or password.";
            }
        }

        private bool YourAuthenticationMethod(string username, string password)
        {
            //Check if user exists with given username and password
            using (var db = new AgriEnergyDbEntities())
            {
                var user = db.Users.FirstOrDefault(u => u.Username == username && u.Password == password);
                return user != null;
            }
        }

    }
}