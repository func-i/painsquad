(function() {
  'use strict';
  this.PainReportCtrl = this.controllerModule.controller("PainReportCtrl", function($scope, $state, report) {
    var chartData, chartOptions, loadChart;
    $scope.reportTitle = "Pain Report";
    chartOptions = function() {
      return {
        width: 300,
        height: 400,
        legend: {
          position: 'top',
          alignment: 'start',
          maxLines: 2
        },
        colors: ["blue", "green", "red", "orange"],
        hAxis: {
          direction: -1,
          slantedText: true,
          slantedTextAngle: 180,
          textStyle: {
            fontSize: 8
          },
          gridlines: {
            color: '#CCC'
          }
        },
        vAxis: {
          title: 'Pain Intensity'
        }
      };
    };
    chartData = function() {
      var data, hsh, label;
      data = [["Date", "Now", "Worst", "Least", "Avg."]];
      if (Object.keys(report).length > 0) {
        for (label in report) {
          hsh = report[label];
          data.push([label, hsh.now, hsh.worst, hsh.least, hsh.average]);
        }
      } else {
        data.push(["", 0, 0, 0, 0]);
      }
      return data;
    };
    loadChart = function() {
      var chart;
      chart = {};
      chart.type = "LineChart";
      chart.options = chartOptions();
      chart.data = chartData();
      return $scope.chart = chart;
    };
    return loadChart();
  });

  this.PainReportCtrl.$inject = ['$scope', '$state', 'report'];

}).call(this);
