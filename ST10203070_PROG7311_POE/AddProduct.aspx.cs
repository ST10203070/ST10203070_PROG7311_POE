using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10203070_PROG7311_POE
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                // User is not logged in, redirect to the login page
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                // User is logged in, check if they are a farmer
                if (IsUserAFarmer())
                {
                    // User is a farmer, show the add product form and hide the message
                    AddProductPanel.Visible = true;
                    NotFarmerMessage.Visible = false;
                }
                else
                {
                    // User is not a farmer, hide the add product form and show the message
                    AddProductPanel.Visible = false;
                    NotFarmerMessage.Visible = true;
                    NotFarmerMessage.Text = "This feature is only available to farmers.";
                }
            }
        }

        private bool IsUserAFarmer()
        {
            // Assume that the role "Farmer" is stored as "Farmer" in the database
            var username = HttpContext.Current.User.Identity.Name;
            using (var context = new AgriEnergyDbEntities())
            {
                var user = context.Users.FirstOrDefault(u => u.Username.Equals(username, StringComparison.OrdinalIgnoreCase));
                return user != null && user.Role.Equals(Roles.Farmer, StringComparison.OrdinalIgnoreCase);
            }
        }

        private int? GetCurrentFarmerId()
        {
            var username = HttpContext.Current.User.Identity.Name;
            using (var context = new AgriEnergyDbEntities())
            {
                // Assuming the 'Email' field in 'Farmers' is used for storing the username
                var farmer = context.Farmers.FirstOrDefault(f => f.Email == username);
                return farmer?.FarmerId;
            }
        }

        protected void SubmitProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Retrieve values from the form fields
                string productName = ProductName.Text;
                string category = Category.Text;
                DateTime productionDate;

                // Validate the production date input
                if (!DateTime.TryParse(ProductionDate.Text, out productionDate))
                {
                    ErrorMessage.Text = "Please enter a valid production date.";
                    ErrorMessage.Visible = true;
                    return;
                }

                // Logic to save these details to the database
                var farmerId = GetCurrentFarmerId();
                if (!farmerId.HasValue)
                {
                    // Handle the error appropriately
                    ErrorMessage.Visible = true;
                    ErrorMessage.Text = "Could not retrieve farmer information.";
                    return;
                }

                using (var context = new AgriEnergyDbEntities())
                {
                    var newProduct = new Product
                    {
                        Name = productName,
                        Category = category,
                        ProductionDate = productionDate,
                        FarmerId = farmerId.Value // Use the retrieved FarmerId
                    };

                    context.Products.Add(newProduct);
                    context.SaveChanges();

                    // Clear the form fields or redirect as necessary
                    SuccessLabel.Visible = true;
                    SuccessLabel.Text = "Product added successfully.";

                    // Optionally clear the form fields after saving
                    ProductName.Text = string.Empty;
                    Category.Text = string.Empty;
                    ProductionDate.Text = string.Empty;
                }
            }
            else
            {
                // If the page isn't valid, you can show an error message
                ErrorMessage.Text = "Please fill in all required fields.";
                ErrorMessage.Visible = true;
            }
        }

    }
}