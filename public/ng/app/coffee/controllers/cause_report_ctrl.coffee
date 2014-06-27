'use strict'

@CauseReportCtrl = @controllerModule.controller "CauseReportCtrl", ($scope, $state, report) ->

  # Functions

  chartOptions = ->
    values = []
    for k,v of report
      values.push v

    max = Math.max.apply @, values

    width: 300
    height: 400
    legend:
      position: 'none'
    colors: ["green"]
    hAxis:
      title: 'Cause Frequency'
      titleTextStyle:
        fontSize: 16
        bold: true
      viewWindow:
        min: 0
        max: max
       gridlines:
          count: max + 1
    vAxis:
      textPosition: 'in'
      textStyle:
        fontSize: 12
        bold: true
        color: 'white'
        auraColor: 'none'
    chartArea:
     width: '90%'
     height: '80%'

  chartData = ->
    data = [["Medication", "Frequency"]]

    if Object.keys(report).length > 0
      for label, freq of report
        data.push [label, freq]
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


@CauseReportCtrl.$inject = ['$scope', '$state', 'reports']