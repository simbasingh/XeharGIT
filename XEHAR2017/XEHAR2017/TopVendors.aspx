<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopVendors.aspx.cs" Inherits="XEHAR2017.TopVendors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager2" runat="server"  EnablePageMethods="true">
</asp:ScriptManager>
    <div>
    <div id="SalesChannelChart" style="width: 900px; height: 500px;"></div>
    </div>
    </form>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
    
    // Load the Visualization API and the piechart package.
    google.charts.load('current', {'packages':['corechart']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);

        
    function drawChart() {
        
        PageMethods.TopVendor(onSucess, onError);
        function onSucess(result) {
            var result1 = [];
          //  var datos = result.replace(/'/g, '"');
            result1 = JSON.parse(result);
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Key');
            data.addColumn('number', 'Value');
           // data.addColumn('number', 'Wholesale');

            result1.forEach(function (row) {
                data.addRow([
                  row.Key,
                  row.Value,
                  //row.Wholesale
                ]);
            });



            // Create our data table out of JSON data loaded from server.
               // var result1 = [];
               // var datos = result.replace(/'/g, '"');
               // result1 = JSON.parse(datos);
               // console.log(result1);
               //// var data = new google.visualization.DataTable(result1);
               // var dataPoints1 = [];

               // for (var i = 0; i < result1.length; i++) {
               //     dataPoints1.push({
               //         label: result1[i].Key, y: result1[i].Value
               //     })
               // }
               // console.log(dataPoints1);
              //  var data = new google.visualization.DataTable(result1);


            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.ColumnChart(document.getElementById('SalesChannelChart'));
            chart.draw(data, {title:"Top Vendors", width: 400, height: 240 });
        }
        function onError(result) {
            alert('Cannot process your request at the moment, please try later.');
        }
    }
        
        

        //PageMethods.TopVendor(onSucess, onError);

        //function onSucess(result) {

        //    var result1 = [];
            
        //    result1 = JSON.parse(result);
        //    console.log(result1);
          
        //    var dataPoints1 = [];

        //    for (var i = 0; i < result1.length; i++) {
        //        dataPoints1.push({
        //            label: result1[i].Key, y: result1[i].Value
        //        })
        //    }
        //    console.log(dataPoints1);
        //    var chart = new CanvasJS.Chart("SalesChannelChart", {
        //        title: {
        //            text: "Top Vendors"
        //        },
        //        data: [
        //        {
        //            // Change type to "doughnut", "line", "splineArea", etc.
        //            type: "column",
        //            dataPoints: dataPoints1,

        //        }
        //        ]

        //    });
        //    chart.render();
        //}
           
        //function onError(result) {
        //    alert('Cannot process your request at the moment, please try later.');
        //}
        

        </script>
    
</body>
</html>
