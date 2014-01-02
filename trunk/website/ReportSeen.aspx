<%@ Page Title="سوق سماء العرب | احصاء المشاهدات" MetaDescription="سوق سماء العرب | ArabiSky.com | احصاء المشاهدات"
    Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="ReportSeen.aspx.cs"
    Inherits="ReportSeen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
          ['Year', 'الاعلان السابع', 'الاعلان السادس', 'الاعلان الخامس', 'الاعلان الرابع', 'الاعلان الثالث', 'الاعلان الثاني', 'الاعلان الاول'],
          ['10-10-2013', 1000, 400, 111, 874, 99, 555, 444],
          ['11-10-2013', 1170, 460, 111, 587, 669, 111, 258],
          ['12-10-2013', 660, 1120, 111, 545, 778, 888, 777],
          ['13-10-2013', 1030, 540, 111, 548, 541, 878, 887]
        ]);

            var options = {
                title: 'Company Performance',
                vAxis: { title: 'Year', titleTextStyle: { color: 'red'} }
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 30px; float: right;">
        <a href='/'>سوق سماء العرب </a>» احصاء المشاهدات
    </div>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>
                <div id="chart_div" style="width: 1000px; height: 500px;">
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
