<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesChannel.aspx.cs" Inherits="XEHAR2017.SalesChannel" %>

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

 <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
    
    // Load the Visualization API and the piechart package.
    google.charts.load('current', {'packages':['corechart']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);
        
        function drawChart(){
        
        PageMethods.SalesChannels(onSucess, onError);

        function onSucess(result) {

            //-------------------------------this is for google charts--------------------------------
            var result1 = [];
            
            result1 = JSON.parse(result);
            console.log(result1);
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Key');
            data.addColumn('number', 'Total Sold');
            
            // data.addColumn('number', 'Wholesale');

            result1.forEach(function (row) {
                data.addRow([
                  row.Key,
                  row.Value,
              
                ]);
            });
            var chart = new google.visualization.ColumnChart(document.getElementById('SalesChannelChart'));
            chart.draw(data, { title: "Top Sales Channels", width: 700, height: 400 });

        }

//--------------------------------------------------------------------------------------------------------------------------

       
           
        function onError(result) {
            alert('Cannot process your request at the moment, please try later.');
        }
        
        }
        </script>
</body>
</html>
