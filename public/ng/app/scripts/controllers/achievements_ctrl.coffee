'use strict'

@AchievementsCtrl = @controllerModule.controller 'AchievementsCtrl', ($scope, $state, $moment, $ionicSlideBoxDelegate) ->

  $scope.achievementData =
    awards: [
      {
        title:      "Rookie"
        image_path: "images/achievements/01-rookie.png"
        date:       $moment().format('ll')
      },
      {
        title:      "Jr. Detective"
        image_path: "images/achievements/02-jrdetective.png"
        date:       $moment().format('ll')
      },
      {
        title:      "Detective"
        image_path: "images/achievements/03-detective.png"
        date:       $moment().format('ll')
      },
      {
        title:      "Lieutenant"
        image_path: "images/achievements/04-lieutenant.png"
        date:       $moment().format('ll')
      },
      {
        title:      "Sergeant"
        image_path: "images/achievements/05-sergeant.png"
        date:       $moment().format('ll')
      },
      {
        title:      "Chief"
        image_path: "images/achievements/06-chief.png"
        date:       $moment().format('ll')
      }
    ]

  $scope.next = ->
    $ionicSlideBoxDelegate.next();

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous();


@AchievementsCtrl.$inject = ['$scope', '$state', '$moment', '$ionicSlideBoxDelegate']