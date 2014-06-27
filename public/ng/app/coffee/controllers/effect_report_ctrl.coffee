'use strict'

@EffectReportCtrl = @controllerModule.controller "EffectReportCtrl", ($scope, $state, report) ->

  # Functions

  chartOptions = ->
    width: 300
    height: 400
    legend:
      position: 'none'
    colors: ["green"]
    hAxis:
      title: 'Average Impact'
      titleTextStyle:
        fontSize: 16
        bold: true
      viewWindow:
        min: 0
        max: 100
      gridlines:
        count: 11
    vAxis:
      textPosition: 'in'
      textStyle:
        fontSize: 12
        bold: true
        color: 'white'
        auraColor: 'none'
    chartArea:
     width: '100%'
     height: '80%'

  chartData = ->
    data = [["Medication", "Frequency"]]

    if Object.keys(report).length > 0
      for label, hsh of report
        data.push [label, hsh.average]
    else
      data.push ["", 0]

    data

  loadChart = ->
    chart = {}
    chart.type = "BarChart"
    chart.options = chartOptions()
    chart.data = chartData()
    $scope.chart = chart

  # Default behaviour

  loadChart()


@EffectReportCtrl.$inject = ['$scope', '$state', 'report']