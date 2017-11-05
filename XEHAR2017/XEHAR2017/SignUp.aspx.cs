using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;

namespace XEHAR2017
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddVendor_Click(object sender, EventArgs e)
        {
            var vendor = new Vendor
            {
                Name = name.Value,
                VIN = vin.Value,
                Email = email.Value,
                Street = address.Value,
                City = city.Value,
                Country = country.Value,
                Zip = zip.Value,

            };
            using (var con = new MySql.Data.MySqlClient.MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString))
            {
                MiddleEarth.CreateVendor(con, vendor);
            }
        }
    }
}