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
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },

        series: data

    });
}

function drawPieGraph(container, data) {

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
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },

        series: data

    });
}