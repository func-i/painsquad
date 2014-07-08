'use strict'

@CauseReportCtrl = @controllerModule.controller "CauseReportCtrl", ($scope, $state, report) ->

  # Variables

  $scope.reportTitle = "Cause Report"

  # Functions

  chartOptions = ->
    width:  300
    height: 450
    legend:
      position: 'none'
    colors: ["green"]

    title: 'Pain Cause %'
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


@CauseReportCtrl.$inject = ['$scope', '$state', 'report']