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
        }

        // Method to register new user
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Retrieve user input from the form
            string username = Username.Text;
            string password = Password.Text; 
            string role = Role.SelectedValue;

            // Hash the password with salt
            string salt = PasswordHashingUtility.CreateSalt(10);
            string hashedPassword = PasswordHashingUtility.GenerateSHA256Hash(password, salt);


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
                    Password = hashedPassword,
                    Salt = salt, // Store salt in the database
                    Role = role
                };

                // Add the new user to the database
                db.Users.Add(newUser);
                try
                {
                    db.SaveChanges();
                    // Add the user to the appropriate role table
                    switch (role)
                    {
                        case "Employee":
                            var newEmployee = new Employee
                            {
                                Name = username, 
                                Email = username 
                            };
                            db.Employees.Add(newEmployee);
                            break;
                        case "Farmer":
                            var newFarmer = new Farmer
                            {
                                Name = username, 
                                Email = username 
                            };
                            db.Farmers.Add(newFarmer);
                            break;
                        default:
                            break;
                    }

                    db.SaveChanges(); // Save changes to role table

                    // Redirect to login page
                    Response.Redirect("Login.aspx", false);
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = "An error occurred while registering. Please try again.";
                }
            }
        }
    }
}


