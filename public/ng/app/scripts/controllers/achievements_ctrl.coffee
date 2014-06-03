'use strict'

@AchievementsCtrl = @controllerModule.controller 'AchievementsCtrl', ($scope, $state, moment, $ionicSlideBoxDelegate, rankings) ->
  # console.log "Achievements Ctrl yo", rankings

  $scope.next = ->
    $ionicSlideBoxDelegate.next();

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous();

  $scope.slideChange = (slideIndex) ->
    # console.log "Changing slides to index: ", slideIndex

@AchievementsCtrl.$inject = ['$scope', '$state', 'moment', '$ionicSlideBoxDelegate', 'rankings']

# @AchievementsCtrl.resolve =
#   rankings: (Ranking, $q) ->
#     defer = $q.defer()
#     Ranking.query (response) ->
#       defer.resolve response
#     defer.promise

  #   [
  #     {
  #       title:      "Rookie"
  #       image_path: "images/achievements/01-rookie.png"
  #       date:       moment().format('ll')
  #     },
  #     {
  #       title:      "Jr. Detective"
  #       image_path: "images/achievements/02-jrdetective.png"
  #       date:       moment().format('ll')
  #     },
  #     {
  #       title:      "Detective"
  #       image_path: "images/achievements/03-detective.png"
  #       date:       moment().format('ll')
  #     },
  #     {
  #       title:      "Lieutenant"
  #       image_path: "images/achievements/04-lieutenant.png"
  #       date:       moment().format('ll')
  #     },
  #     {
  #       title:      "Sergeant"
  #       image_path: "images/achievements/05-sergeant.png"
  #       date:       moment().format('ll')
  #     },
  #     {
  #       title:      "Chief"
  #       image_path: "images/achievements/06-chief.png"
  #       date:       moment().format('ll')
  #     }
  #   ]
