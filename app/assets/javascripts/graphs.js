function drawLineGraph(container, data) {

    Highcharts.chart(container, {

        title: {
            text: 'Sales by category'
        },

        subtitle: {
            text: 'In the past 30 days'
        },

        yAxis: {
            title: {
                text: 'Amount sold'
            },

        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },
        tooltip: {
            formatter: function() {
                return this.series.name + ': <b> $' + this.y + '</b>';
            }
        },


        series: data


    });
}

function drawPieGraph(container, dat) {
    Highcharts.chart(container, {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Total sold by category'
        },
        subtitle: {
            text: 'In the past 30 days'
        },

        tooltip: {
            pointFormat: '{series.name}: <b>$ {point.y}</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Amount sold',
            colorByPoint: true,
            data: dat
        }]
    });
}