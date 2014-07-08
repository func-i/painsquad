(function() {
  'use strict';
  this.CauseReportCtrl = this.controllerModule.controller("CauseReportCtrl", function($scope, $state, report) {
    var chartData, chartOptions, loadChart;
    $scope.reportTitle = "Cause Report";
    chartOptions = function() {
      return {
        width: 300,
        height: 450,
        legend: {
          position: 'none'
        },
        colors: ["green"],
        title: 'Pain Cause %',
        titlePosition: 'out',
        titleTextStyle: {
          fontSize: 16,
          bold: true,
          italic: true
        },
        hAxis: {
          viewWindow: {
            min: 0,
            max: 100
          },
          gridlines: {
            count: 10
          }
        },
        vAxis: {
          textPosition: 'in',
          textStyle: {
            fontSize: 12,
            bold: true,
            color: 'white',
            auraColor: 'gray'
          }
        },
        chartArea: {
          width: '90%',
          height: '85%'
        }
      };
    };
    chartData = function() {
      var data, freq, label;
      data = [["Medication", "Frequency"]];
      if (Object.keys(report).length > 0) {
        for (label in report) {
          freq = report[label];
          data.push([label, freq]);
        }
      } else {
        data.push(["", 0]);
      }
      return data;
    };
    loadChart = function() {
      var chart;
      chart = {};
      chart.type = "BarChart";
      chart.options = chartOptions();
      chart.data = chartData();
      return $scope.chart = chart;
    };
    return loadChart();
  });

  this.CauseReportCtrl.$inject = ['$scope', '$state', 'report'];

}).call(this);
