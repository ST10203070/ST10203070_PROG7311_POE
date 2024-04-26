﻿using System;
using System.Linq;
using System.Web.UI;
using ST10203070_PROG7311_POE;

namespace ST10203070_PROG7311_POE
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Additional logic can be added here if needed
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Retrieve user input from the form
            string username = Username.Text;
            string password = Password.Text; // In a real-world application, password should be hashed
            string role = Role.SelectedValue;

            // Check if the username (email) already exists
            using (var db = new AgriEnergyDbEntities())
            {
                var userExists = db.Users.Any(user => user.Username == username);
                if (userExists)
                {
                    ErrorMessage.Text = "Username (email) already exists.";
                    return;
                }

                // Create a new user instance and set properties
                var newUser = new User
                {
                    Username = username,
                    Password = password, // Remember, in a real application you should hash the password
                    Role = role
                };

                // Add the new user to the database
                db.Users.Add(newUser);
                try
                {
                    db.SaveChanges();
                    // Redirect to login page or show a success message
                    Response.Redirect("Login.aspx", false);
                }
                catch (Exception ex)
                {
                    // Log the exception (e.g., to a file or database)
                    ErrorMessage.Text = "An error occurred while registering. Please try again.";
                }
            }
        }
    }
}
