(function() {
  'use strict';
  this.ReportCtrl = this.controllerModule.controller("ReportCtrl", function($scope, $state, reports) {
    var chart1, hsh, label, report;
    chart1 = {};
    chart1.type = "ColumnChart";
    report = reports[0].data;
    chart1 = {};
    chart1.type = "ColumnChart";
    chart1.data = [["Medication", "Frequency", "Effectiveness"]];
    for (label in report) {
      hsh = report[label];
      chart1.data.push([label, hsh.count, hsh.average]);
    }
    chart1.options = {
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
    console.log(chart1.data);
    return $scope.chart = chart1;
  });

  this.ReportCtrl.$inject = ['$scope', '$state', 'reports'];

}).call(this);
