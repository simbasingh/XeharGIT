<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Quicky.index" MasterPageFile="~/Quicky.Master"%>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <%
        json.Value = Customers();
        
         %>
     <%--So we want to create a variable to assign the value of the contents the json string from HTML so that javascript can use it--%>
    <script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    //function drawChart() {

    //    var options = {
    //        title: 'USA City Distribution'
    //    };
    //    var r = getElementById("json");
    //    $.ajax({
    //        type: "GET",
    //        url: "index.aspx",
    //        data: '{}',
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (r) {
    //            var data = google.visualization.arrayToDataTable(r.d);
    //            var chart = new google.visualization.PieChart($("#piechart")[0]);
    //            chart.draw(data, options);
    //        },
    //        failure: function (r) {
    //            alert(r.d);
    //        },
    //        error: function (r) {
    //            alert(r.d);
    //        }
    //    });
    //}
    function drawChart() {
        //var r = document.getElementById("Body_json");
        var data = google.visualization.arrayToDataTable([document.getElementById("Body_json").value]);
        //var data = google.visualization.arrayToDataTable([
        //  ['Task', 'Hours per Day'],
        //  ['Work', 11],
        //  ['Eat', 2],
        //  ['Commute', 2],
        //  ['Watch TV', 2],
        //  ['Sleep', 7]
        //]);

        var options = {
            title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
    }
</script>
</asp:Content>
<asp:Content ContentPlaceHolderID="Title" runat="server">Home</asp:Content>
<asp:Content ContentPlaceHolderID="Body" runat="server">
    <%--<h1 runat="server" id="CLT"></h1>--%>
   // <input type="hidden" name="json" id="json" runat="server" />
    
</asp:Content>
