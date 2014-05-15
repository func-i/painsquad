'use strict'

@AchievementsCtrl = @controllerModule.controller 'AchievementsCtrl', ($scope, $state, moment, $ionicSlideBoxDelegate) ->
  currentTime = moment().format('ll')

  $scope.achievementData =
    awards: [
      {
        title:      "Rookie"
        image_path: "images/achievements/01-rookie.png"
        date:       currentTime
      },
      {
        title:      "Jr. Detective"
        image_path: "images/achievements/02-jrdetective.png"
        date:       currentTime
      },
      {
        title:      "Detective"
        image_path: "images/achievements/03-detective.png"
        date:       currentTime
      },
      {
        title:      "Lieutenant"
        image_path: "images/achievements/04-lieutenant.png"
        date:       currentTime
      },
      {
        title:      "Sergeant"
        image_path: "images/achievements/05-sergeant.png"
        date:       currentTime
      },
      {
        title:      "Chief"
        image_path: "images/achievements/06-chief.png"
        date:       currentTime
      }
    ]

  $scope.next = ->
    $ionicSlideBoxDelegate.next();

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous();

  $scope.slideChange = (slideIndex) ->
    console.log "Changing slides to index: ", slideIndex

@AchievementsCtrl.$inject = ['$scope', '$state', 'moment', '$ionicSlideBoxDelegate']
