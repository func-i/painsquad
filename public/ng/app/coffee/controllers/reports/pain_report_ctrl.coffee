'use strict'

@PainReportCtrl = @controllerModule.controller "PainReportCtrl", ($scope, $state, report) ->

  # Variables

  $scope.reportTitle = "Pain Report"

  # Functions

  chartOptions = ->
    width:  300
    height: 450

    legend:
      position: 'top'
      alignment: 'center'
      maxLines: 2

    colors: ["blue", "red", "green", "orange"]

    hAxis:
      direction: -1
      slantedText: true
      slantedTextAngle: 180
      textStyle:
        fontSize: 10
        maxValue: 5
      gridlines:
        color: '#CCC'

    # curveType: 'function'

    vAxis:
      title: 'Pain Intensity'

    chartArea:
     width:  '75%'
     height: '75%'

  chartData = ->
    data = [['Date', 'Least', 'Most']]

    if Object.keys(report).length > 0
      for label, hsh of report
        data.push [label, hsh.least, hsh.worst]
    else
      data.push ["", 0, 0]

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