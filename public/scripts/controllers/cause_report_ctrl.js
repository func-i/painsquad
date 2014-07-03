(function() {
  'use strict';
  this.CauseReportCtrl = this.controllerModule.controller("CauseReportCtrl", function($scope, $state, report) {
    var chartData, chartOptions, loadChart;
    chartOptions = function() {
      var k, max, v, values;
      values = [];
      for (k in report) {
        v = report[k];
        values.push(v);
      }
      max = Math.max.apply(this, values);
      return {
        width: 300,
        height: 400,
        legend: {
          position: 'none'
        },
        colors: ["green"],
        hAxis: {
          title: 'Cause Frequency',
          titleTextStyle: {
            fontSize: 16,
            bold: true
          },
          viewWindow: {
            min: 0,
            max: max
          },
          gridlines: {
            count: max + 1
          }
        },
        vAxis: {
          textPosition: 'in',
          textStyle: {
            fontSize: 12,
            bold: true,
            color: 'white',
            auraColor: 'none'
          }
        },
        chartArea: {
          width: '90%',
          height: '80%'
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
