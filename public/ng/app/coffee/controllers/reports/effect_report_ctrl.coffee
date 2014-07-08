'use strict'

@EffectReportCtrl = @controllerModule.controller "EffectReportCtrl", ($scope, $state, report) ->

  # Variables

  $scope.reportTitle = "Effect Report"

  # Functions

  chartOptions = ->
    width:  300
    height: 450
    legend:
      position: 'none'
    colors: ["green"]

    title: 'Pain Impact %'
    titlePosition :'out'
    titleTextStyle:
      fontSize: 16
      bold:     true
      italic:   true

    hAxis:
      viewWindow:
        min: 0
        max: 100
       gridlines:
        count: 10

    vAxis:
      textPosition: 'in'
      textStyle:
        fontSize:  12
        bold:      true
        color:     'white'
        auraColor: 'gray'

    chartArea:
     width:  '90%'
     height: '85%'

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