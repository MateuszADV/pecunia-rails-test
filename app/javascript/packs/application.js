// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// test

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Chart from 'chart.js/auto';
// global.Chart = Chart;


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// = require reports_kit/application
// = require_tree
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.

// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// const Chart = require('chart.js')

document.addEventListener('turbolinks:load', () => {


    const myReport = document.querySelector("#myChart").dataset.chart;
    const typeChart = document.querySelector("#typeChart").dataset.chart;
    // const typeReport = document.querySelector("#typeReport").dataset.chart;
    console.log(typeChart);
    console.log(myReport);

    const root = location.protocol + '//' + location.host;
    
    // const lang = document.querySelector("#lang").dataset.chart;
    // console.log(root + lang);

    // const chartUrl =  "http://localhost:3000/reports_kit/reports.json?report_params[key]=my_reports&properties={}";
    const chartUrl = root + "/reports_kit/reports.json?report_params[key]=" + myReport + "&properties={}";
    // const chartUrl = "https://pecunia-rails.herokuapp.com/reports_kit/reports.json?report_params[key]=" + myReport + "&properties={}"

    fetch(chartUrl)
        .then(function(response) {
             response.json().then(data => {
                // do something with your data
                var chartData = data.data.chart_data;
                //var datasets = chartData.datasets;
                // var labels = chartData.labels;
                // var options = chartData.options;
                 console.log("-----------------------------------------------");
                 console.log(data);
                 console.log(data.data.chart_data.labels.length);
                 console.log(data.data.chart_data.datasets[0].backgroundColor);
                 console.log("===============================================");
                 console.log(chartData);
                 console.log("===============================================");
                 console.log(chartData.options.legend);
                 console.log("-----------------------------------------------");
                 var options = chartData.options;
                 var labels = chartData.options.legend
                // var options = {
                //     // All of my other bar chart option here
                //     scales: {
                //         yAxes: [{
                //             ticks: {
                //                 beginAtZero:true
                //             }
                //         }]
                //         ,
                //         x: {
                //             stacked: true,
                //         },
                //         y: {
                //             stacked: true
                //         }
                //     },
                //
                //     plugins: {
                //         title: {
                //             display: true,
                //             text: 'PECUNIA CHART'
                //         },
                //         // legend: {
                //         //     display: true,
                //         //     labels: {
                //         //         color: 'rgb(255, 99, 132)'
                //         //     }
                //         // }
                //     }
                // }

                const ctx = document.getElementById('myChart').getContext('2d');
                const myChart = new Chart(ctx, {
                    // type: 'bar',
                    type: typeChart,
                    data: chartData,
                    labels: labels,
                    options: options
                });

            });
        })

        .catch(function() {
            // This is where you run code if the server returns any errors
            });
})