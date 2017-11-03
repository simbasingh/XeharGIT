using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quicky
{
    public partial class index : System.Web.UI.Page
    {
        MySqlConnection k = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            //CLT.InnerText = Customers();
        }
        public string Open()
        {

            string m = "";

            try
            {
                k.Open();
                return "The connection was successful";
            }
            catch (Exception s)
            {
                m = "Failure" + s.Message;
                return m;
            }

        }
        public string Customers()
        {
             Open();
            string query = "SELECT * FROM customers";

            DataTable DT_Results;

            DT_Results = RunSQL(query, k);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(DT_Results);
            
            return JSONString;

        }

        private DataTable RunSQL(string query, MySqlConnection k)
        {
            
            using (MySqlCommand cmd = new MySqlCommand(query, k))
            {
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }

        }
    }

}