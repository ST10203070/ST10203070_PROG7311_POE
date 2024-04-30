using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10203070_PROG7311_POE
{
    public partial class ViewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (IsEmployee())
                {
                    PopulateFarmers();
                    PopulateProductTypes();
                    updatePanel.Visible = true;
                    NotEmployeeMessage.Visible = false;
                }
                else
                {
                    updatePanel.Visible = false;
                    NotEmployeeMessage.Visible = true;
                    NotEmployeeMessage.Text = "This feature is only available to employees.";
                }
            }
        }

        private bool IsEmployee()
        {
            // Assume that the role "Employee" is stored as "Employee" in the database
            var username = HttpContext.Current.User.Identity.Name;
            using (var context = new AgriEnergyDbEntities())
            {
                var user = context.Users.FirstOrDefault(u => u.Username.Equals(username, StringComparison.OrdinalIgnoreCase));
                return user != null && user.Role.Equals("Employee", StringComparison.OrdinalIgnoreCase);
            }
        }

        private void PopulateFarmers()
        {
            using (var context = new AgriEnergyDbEntities())
            {
                FarmerDropdown.DataSource = context.Farmers.Select(f => new { f.FarmerId, f.Name }).ToList();
                FarmerDropdown.DataValueField = "FarmerId";
                FarmerDropdown.DataTextField = "Name";
                FarmerDropdown.DataBind();
                FarmerDropdown.Items.Insert(0, new ListItem("--Select Farmer--", ""));
            }
        }

        private void PopulateProductTypes()
        {
            using (var context = new AgriEnergyDbEntities())
            {
                ProductTypeDropdown.DataSource = context.Products.Select(p => p.Category).Distinct().ToList();
                ProductTypeDropdown.DataBind();
                ProductTypeDropdown.Items.Insert(0, new ListItem("--Select Product Type--", ""));
            }
        }

        protected void FarmerDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Optional: Automatically filter products when a farmer is selected
            FilterProducts();
        }

        protected void FilterProducts_Click(object sender, EventArgs e)
        {
            FilterProducts();
        }

        private void FilterProducts()
        {
            var startDate = String.IsNullOrEmpty(StartDate.Text) ? (DateTime?)null : DateTime.Parse(StartDate.Text);
            var endDate = String.IsNullOrEmpty(EndDate.Text) ? (DateTime?)null : DateTime.Parse(EndDate.Text);
            var selectedFarmerId = FarmerDropdown.SelectedValue;
            var productType = ProductTypeDropdown.SelectedValue;

            using (var context = new AgriEnergyDbEntities())
            {
                var productsQuery = context.Products.AsQueryable();

                if (!string.IsNullOrEmpty(selectedFarmerId))
                {
                    int farmerId = int.Parse(selectedFarmerId);
                    productsQuery = productsQuery.Where(p => p.FarmerId == farmerId);
                }

                if (startDate.HasValue)
                {
                    productsQuery = productsQuery.Where(p => p.ProductionDate >= startDate.Value);
                }

                if (endDate.HasValue)
                {
                    productsQuery = productsQuery.Where(p => p.ProductionDate <= endDate.Value);
                }

                if (!string.IsNullOrEmpty(productType) && productType != "--Select Product Type--")
                {
                    productsQuery = productsQuery.Where(p => p.Category == productType);
                }

                ProductsGridView.DataSource = productsQuery.ToList();
                ProductsGridView.DataBind();
            }
        }
    }
}