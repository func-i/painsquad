(function() {
  'use strict';
  this.ReportCtrl = this.controllerModule.controller("ActionReportCtrl", function($scope, $state, reports) {
    var chartData, chartOptions, loadChart;
    chartOptions = function() {
      return {
        width: 300,
        height: 400,
        legend: {
          position: 'top'
        },
        vAxes: {
          0: {
            gridlines: {
              color: 'transparent'
            }
          },
          1: {
            gridlines: {
              color: 'transparent'
            }
          }
        },
        hAxis: {
          direction: -1,
          slantedText: true,
          slantedTextAngle: 90
        },
        series: {
          0: {
            targetAxisIndex: 0
          },
          1: {
            lineWidth: 0,
            pointSize: 5,
            targetAxisIndex: 1,
            type: 'line'
          }
        },
        colors: ["red", "green"]
      };
    };
    chartData = function() {
      var data, hsh, label, report;
      report = reports[0].data;
      data = [["Medication", "Frequency", "Effectiveness"]];
      for (label in report) {
        hsh = report[label];
        data.push([label, hsh.count, hsh.average]);
      }
      return data;
    };
    loadChart = function() {
      var chart;
      chart = {};
      chart.type = "ColumnChart";
      chart.options = chartOptions();
      chart.data = chartData();
      return $scope.chart = chart;
    };
    return loadChart();
  });

  this.ReportCtrl.$inject = ['$scope', '$state', 'reports'];

}).call(this);
