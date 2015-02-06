(function() {
  'use strict';
  this.ActionReportCtrl = this.controllerModule.controller("ActionReportCtrl", function($scope, $state, report) {
    var chartData, chartOptions, loadChart;
    $scope.reportTitle = "Action Report";
    chartOptions = function() {
      return {
        width: 300,
        height: 450,
        legend: {
          position: 'top',
          alignment: 'center',
          maxLines: 2
        },
        vAxes: {
          0: {
            title: 'Action Frequency',
            gridlines: {
              color: 'transparent'
            }
          },
          1: {
            title: 'Average Action Effectiveness',
            gridlines: {
              color: 'transparent',
              count: 11
            },
            viewWindow: {
              min: 0,
              max: 100
            }
          }
        },
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
        colors: ["red", "green"],
        chartArea: {
          width: '75%',
          height: '75%'
        }
      };
    };
    chartData = function(reportData) {
      var data, hsh, label;
      data = [["Medication", "Frequency", "Effectiveness"]];
      if (Object.keys(reportData).length > 0) {
        for (label in reportData) {
          hsh = reportData[label];
          data.push([label, hsh.count, hsh.average]);
        }
      } else {
        data.push(["", 0, 0]);
      }
      return data;
    };
    loadChart = function() {
      var chart, medChart, stratChart;
      chart = {};
      chart.type = "ColumnChart";
      chart.options = chartOptions();
      medChart = angular.copy(chart);
      medChart.data = chartData(report.med);
      $scope.medChart = medChart;
      stratChart = angular.copy(chart);
      stratChart.data = chartData(report.strat);
      return $scope.stratChart = stratChart;
    };
    return loadChart();
  });

  this.ActionReportCtrl.$inject = ['$scope', '$state', 'report'];

}).call(this);
