﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/DataViz.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="chart-wrapper">
    <div id="chart" style="background: center no-repeat url('@Url.Content("~/content/shared/styles/world-map.png")');"></div>
</div>
<script>
    function createChart() {
        $("#chart").kendoChart({
            theme: $(document).data("kendoSkin") || "default",
            title: {
                text: "Internet Users"
            },
            legend: {
                position: "bottom"
            },
            chartArea: {
                background: ""
            },
            seriesDefaults: {
                type: "area"
            },
            series: [{
                name: "World",
                data: [15.7, 16.7, 20, 23.5, 26.6]
            }, {
                name: "United States",
                data: [67.96, 68.93, 75, 74, 78]
            }],
            valueAxis: {
                labels: {
                    format: "{0}%"
                }
            },
            categoryAxis: {
                categories: [2005, 2006, 2007, 2008, 2009]
            },
            tooltip: {
                visible: true,
                format: "{0}%"
            }
        });
    }

    $(document).ready(function() {
        setTimeout(function() {
            createChart();

            // Initialize the chart with a delay to make sure
            // the initial animation is visible
        }, 400);

        $(document).bind("kendo:skinChange", function(e) {
            createChart();
        });
    });
</script>
</asp:Content>
