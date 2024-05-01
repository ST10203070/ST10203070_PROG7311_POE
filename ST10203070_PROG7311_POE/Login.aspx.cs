using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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

        // Method to act on login button being clicked
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (UserAuthenticationMethod(Username.Text, Password.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(Username.Text, false);
            }
            else
            {
                ErrorMessage.Text = "Invalid username or password.";
            }
        }

        // Method to authenticate user credentials entered against database data
        private bool UserAuthenticationMethod(string username, string password)
        {
            using (var db = new AgriEnergyDbEntities())
            {
                var user = db.Users.FirstOrDefault(u => u.Username == username);
                if (user != null)
                {
                    // Hash the input password with the stored salt and compare
                    string hashedPassword = PasswordHashingUtility.GenerateSHA256Hash(password, user.Salt);
                    return hashedPassword == user.Password;
                }
                return false;
            }
        }

    }
}