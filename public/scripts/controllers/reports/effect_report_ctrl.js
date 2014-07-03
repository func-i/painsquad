(function() {
  'use strict';
  this.EffectReportCtrl = this.controllerModule.controller("EffectReportCtrl", function($scope, $state, report) {
    var chartData, chartOptions, loadChart;
    $scope.reportTitle = "Effect Report";
    chartOptions = function() {
      return {
        width: 300,
        height: 400,
        legend: {
          position: 'none'
        },
        colors: ["green"],
        hAxis: {
          title: 'Average Impact',
          titleTextStyle: {
            fontSize: 16,
            bold: true
          },
          viewWindow: {
            min: 0,
            max: 100
          },
          gridlines: {
            count: 11
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
          width: '100%',
          height: '80%'
        }
      };
    };
    chartData = function() {
      var data, hsh, label;
      data = [["Medication", "Frequency"]];
      if (Object.keys(report).length > 0) {
        for (label in report) {
          hsh = report[label];
          data.push([label, hsh.average]);
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

  this.EffectReportCtrl.$inject = ['$scope', '$state', 'report'];

}).call(this);
