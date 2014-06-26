'use strict'

@ReportCtrl = @controllerModule.controller "ReportCtrl", ($scope, $state, reports) ->

  # Functions


  # Default behaviour

  chart1 = {}
  chart1.type = "ColumnChart"

  # TODO don't do it like this
  report = reports[0].data

  chart1 = {}
  chart1.type = "ColumnChart"
  chart1.data = [["Medication", "Frequency", "Effectiveness"]]

  for label, hsh of report
    chart1.data.push [label, hsh.count, hsh.average]

  chart1.options =
    width: 300
    height: 400
    legend:
      position: 'top'
    vAxes:
      0: {gridlines: {color: 'transparent'}}
      1: {gridlines: {color: 'transparent'}}
    hAxis:
      direction:-1,
      slantedText:true,
      slantedTextAngle:90 # here you can even use 180
    series:
      0:
        targetAxisIndex: 0
      1:
        lineWidth: 0,
        pointSize: 5,
        targetAxisIndex: 1

        type: 'line'
    colors: ["red", "green"]

  console.log chart1.data

  $scope.chart = chart1

@ReportCtrl.$inject = ['$scope', '$state', 'reports']