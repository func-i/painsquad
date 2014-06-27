'use strict'

@PainReportCtrl = @controllerModule.controller "PainReportCtrl", ($scope, $state, report) ->

  # Functions

  chartOptions = ->
    width: 300
    height: 400
    legend:
      position: 'top'
      alignment: 'start'
      maxLines: 2
    colors: ["blue", "green", "red", "orange"]
    hAxis:
      direction: -1
      slantedText: true
      slantedTextAngle: 180
      textStyle:
        fontSize: 8
      gridlines:
        color: '#CCC'
    vAxis:
      title: 'Pain Intensity'

  chartData = ->
    data = [["Date", "Now", "Worst", "Least", "Average"]]

    if Object.keys(report).length > 0
      for label, hsh of report
        data.push [label, hsh.now, hsh.worst, hsh.least, hsh.average]
    else
      data.push ["", 0]

    data

  loadChart = ->
    chart = {}
    chart.type = "LineChart"
    chart.options = chartOptions()
    chart.data = chartData()
    $scope.chart = chart

  # Default behaviour

  loadChart()


@PainReportCtrl.$inject = ['$scope', '$state', 'report']