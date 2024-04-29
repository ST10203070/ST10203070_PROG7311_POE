using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10203070_PROG7311_POE
{
    public partial class AddFarmer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure that this page is only accessible by employees
            if (!IsPostBack)
            {
                if (!IsUserAnEmployee())
                {
                    AddFarmerPanel.Visible = false;
                    NotEmployeeMessage.Visible = true;
                    NotEmployeeMessage.Text = "This feature is only available to employees.";
                }
                else
                {
                    AddFarmerPanel.Visible = true;
                    NotEmployeeMessage.Visible = false;
                }
            }
        }

        protected void AddFarmer_Click(object sender, EventArgs e)
        {
            string farmerName = FarmerName.Text;
            string farmerEmail = FarmerEmail.Text;
            string tempPassword = "GO"; // Static temporary password for prototype purposes

            using (var db = new AgriEnergyDbEntities())
            {
                // Check if the farmer already exists
                var farmerExists = db.Farmers.Any(farmer => farmer.Email == farmerEmail);
                if (farmerExists)
                {
                    ErrorMessage.Text = "Farmer with the provided email already exists.";
                    ErrorMessage.Visible = true;
                    return;
                }

                // Create a new Farmer and User instance and set their properties
                var newFarmer = new Farmer
                {
                    Name = farmerName,
                    Email = farmerEmail
                };

                // Add the new farmer to the Farmers table
                db.Farmers.Add(newFarmer);

                // Hash the temporary password "GO"
                string salt = PasswordHashingUtility.CreateSalt(10);
                string hashedPassword = PasswordHashingUtility.GenerateSHA256Hash(tempPassword, salt);

                var newUser = new User
                {
                    Username = farmerEmail, // Using the email as the username
                    Password = hashedPassword,
                    Salt = salt,
                    Role = "Farmer"
                };

                // Add the new user to the Users table
                db.Users.Add(newUser);

                try
                {
                    db.SaveChanges();
                    SuccessLabel.Text = "Farmer added successfully. To login, use the email as the username and 'GO' as the password.";
                    SuccessLabel.Visible = true;
                    ClearForm();
                }
                catch (Exception ex)
                {
                    // Log the exception (e.g., to a file or database)
                    ErrorMessage.Text = "An error occurred while adding the farmer. Please try again.";
                    ErrorMessage.Visible = true;
                }
            }
        }

        private void ClearForm()
        {
            FarmerName.Text = string.Empty;
            FarmerEmail.Text = string.Empty;
        }

        private bool IsUserAnEmployee()
        {
            // Retrieve the logged-in user's role and check if they are an employee
            var username = HttpContext.Current.User.Identity.Name;
            using (var db = new AgriEnergyDbEntities())
            {
                var user = db.Users.FirstOrDefault(u => u.Username == username);
                return user != null && user.Role.Equals("Employee", StringComparison.OrdinalIgnoreCase);
            }
        }
    }
}
