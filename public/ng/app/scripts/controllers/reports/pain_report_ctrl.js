(function() {
  'use strict';
  this.PainReportCtrl = this.controllerModule.controller("PainReportCtrl", function($scope, $state, report) {
    var chartData, chartOptions, loadChart;
    $scope.reportTitle = "Pain Report";
    chartOptions = function() {
      return {
        width: 300,
        height: 450,
        legend: {
          position: 'top',
          alignment: 'center',
          maxLines: 2
        },
        colors: ["blue", "red"],
        hAxis: {
          direction: -1,
          slantedText: true,
          slantedTextAngle: 180,
          textStyle: {
            fontSize: 10,
            maxValue: 5
          },
          gridlines: {
            color: '#CCC'
          }
        },
        vAxis: {
          title: 'Pain Intensity'
        },
        chartArea: {
          width: '75%',
          height: '75%'
        }
      };
    };
    chartData = function() {
      var data, hsh, label;
      data = [['Date', 'Least', 'Most']];
      if (Object.keys(report).length > 0) {
        for (label in report) {
          hsh = report[label];
          data.push([label, hsh.least, hsh.worst]);
        }
      } else {
        data.push(["", 0, 0]);
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
