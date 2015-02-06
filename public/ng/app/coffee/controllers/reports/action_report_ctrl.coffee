'use strict'

@ActionReportCtrl = @controllerModule.controller "ActionReportCtrl", ($scope, $state, report) ->

  # Variables

  $scope.reportTitle = "Action Report"

  # Functions

  chartOptions = ->
    width: 300
    height: 450
    legend:
      position: 'top'
      alignment: 'center'
      maxLines: 2
    vAxes:
      0:
        title: 'Action Frequency'
        gridlines: {color: 'transparent'}

      1:
        title: 'Average Action Effectiveness'
        gridlines:
          color: 'transparent'
          count: 11
        viewWindow:
          min: 0
          max: 100

    hAxis:
      direction: -1
      slantedText: true
      slantedTextAngle: 180
      textStyle:
        fontSize: 8
      gridlines:
        color: '#CCC'
    series:
      0:
        targetAxisIndex: 0
      1:
        lineWidth: 0
        pointSize: 5
        targetAxisIndex: 1
        type: 'line'

    colors: ["red", "green"]
    chartArea:
     width:  '75%'
     height: '75%'

  chartData = (reportData) ->
    data = [["Medication", "Frequency", "Effectiveness"]]

    if Object.keys(reportData).length > 0
      for label, hsh of reportData
        data.push [label, hsh.count, hsh.average]
    else
      data.push ["", 0, 0]

    data

  loadChart = ->
    chart = {}
    chart.type = "ColumnChart"
    chart.options = chartOptions()    

    medChart = angular.copy(chart)
    medChart.data = chartData(report.med)
    $scope.medChart = medChart

    stratChart = angular.copy(chart)
    stratChart.data = chartData(report.strat)
    $scope.stratChart = stratChart

  # Default behaviour
  loadChart()


@ActionReportCtrl.$inject = ['$scope', '$state', 'report']