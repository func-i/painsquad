'use strict'

@ActionReportCtrl = @controllerModule.controller "ActionReportCtrl", ($scope, $state, report) ->

  # Functions

  chartOptions = ->
    width: 300
    height: 400
    legend:
      position: 'top'
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
    series:
      0:
        targetAxisIndex: 0
      1:
        lineWidth: 0
        pointSize: 5
        targetAxisIndex: 1

        type: 'line'
    colors: ["red", "green"]

  chartData = ->
    data = [["Medication", "Frequency", "Effectiveness"]]

    if Object.keys(report).length > 0
      for label, hsh of report
        data.push [label, hsh.count, hsh.average]
    else
      data.push ["", 0, 0]

    data

  loadChart = ->
    chart = {}
    chart.type = "ColumnChart"
    chart.options = chartOptions()
    chart.data = chartData()
    $scope.chart = chart

  # Default behaviour
  loadChart()


@ActionReportCtrl.$inject = ['$scope', '$state', 'report']