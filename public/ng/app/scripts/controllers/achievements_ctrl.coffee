'use strict'

@AchievementsCtrl = @controllerModule.controller 'AchievementsCtrl', ($scope, $state, moment, $ionicSlideBoxDelegate, achievements) ->
  $scope.achievementData = [
      {
        name:       'rookie'
        locked:     true
        image_path: "images/achievements/01-rookie.png"
        date:       null
      },
      {
        name:       'junior_detective'
        locked:     true
        image_path: "images/achievements/02-jrdetective.png"
        date:       null
      },
      {
        name:       'detective'
        locked:     true
        image_path: "images/achievements/03-detective.png"
        date:       null
      },
      {
        name:       'sergeant'
        locked:     true
        image_path: "images/achievements/04-lieutenant.png"
        date:       null
      },
      {
        name:       'lieutenant'
        locked:     true
        image_path: "images/achievements/05-sergeant.png"
        date:       null
      },
      {
        name:       'chief'
        locked:     true
        image_path: "images/achievements/06-chief.png"
        date:       null
      }
    ]

  mergeAchievementData = ->
    for item, index in achievements.ranks
      unlockAchievement($scope.achievementData[index], item)

  unlockAchievement = (achievement, item) ->
    achievement.locked = false
    achievement.date   = moment(item.created_at).format('ll')

  $scope.next = ->
    $ionicSlideBoxDelegate.next();

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous();

  mergeAchievementData()

@AchievementsCtrl.$inject = ['$scope', '$state', 'moment', '$ionicSlideBoxDelegate', 'achievements']
