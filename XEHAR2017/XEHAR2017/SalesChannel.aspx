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


     <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <script type="text/javascript">
        
        

        PageMethods.SalesChannels(onSucess, onError);

        function onSucess(result) {

            var result1 = [];
            
            result1 = JSON.parse(result);
            console.log(result1);
          
            var dataPoints1 = [];

            for (var i = 0; i < result1.length; i++) {
                dataPoints1.push({
                    label: result1[i].Key, y: result1[i].Value
                })
            }
            console.log(dataPoints1);
            var chart = new CanvasJS.Chart("SalesChannelChart", {
                title: {
                    text: "Top Sales Channels"
                },
                data: [
                {
                    // Change type to "doughnut", "line", "splineArea", etc.
                    type: "column",
                    dataPoints: dataPoints1,

                }
                ]

            });
            chart.render();
        }
           
        function onError(result) {
            alert('Cannot process your request at the moment, please try later.');
        }
        

        </script>
</body>
</html>
