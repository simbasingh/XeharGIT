using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEHAR2017
{
    public partial class SalesChannel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string SalesChannels()
        {
             MySqlConnection k = new MySqlConnection(WebConfigurationManager.ConnectionStrings["Xehar"].ConnectionString);
            k.Open();
            string query = "select  s.Name, sum(p.SoldOnSalesChannel) as su from saleschannels as s,  productsaleschannels as p where p.SCID = s.SCID group by s.Name";

            MySqlCommand cmd = new MySqlCommand(query, k);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            MySqlDataReader r = cmd.ExecuteReader();
           // k.Close();
            var libyList = new List<KeyValuePair<string, Int32>>();
            while (r.Read())
            {
                var kv = new KeyValuePair<string, int>(r.GetString(0), r.GetInt32(1));
                libyList.Add(kv);

            }
            r.Close();
            var JSONString = JsonConvert.SerializeObject(libyList);


            

            // test for other query... read on monday

            // int [] pid= DT_Results.AsEnumerable().Select(r => r.Field<int>("PID")).ToArray();
            //var pid = DT_Results.AsEnumerable().Select(r => r.Field<int>("PID")).ToList();
            //pid.ForEach(Debug.Write());
            // string jpid=TopSalesChannels(pid);
            // var re = "hello";

            return JSONString;

        }
    }
}