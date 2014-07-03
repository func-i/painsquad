'use strict'

@AchievementsCtrl = @controllerModule.controller 'AchievementsCtrl', ($scope, $state, $ionicSlideBoxDelegate, $ionicModal, moment, achievements) ->
  $scope.selectedAward = {}

  $scope.achievementData = [
      {
        name:       'rookie'
        locked:     true
        image_path: 'images/achievements/rookie.png'
        date:       null
      },
      {
        name:       'junior_detective'
        locked:     true
        image_path: 'images/achievements/junior_detective.png'
        date:       null
      },
      {
        name:       'detective'
        locked:     true
        image_path: 'images/achievements/detective.png'
        date:       null
      },
      {
        name:       'sergeant'
        locked:     true
        image_path: 'images/achievements/lieutenant.png'
        date:       null
      },
      {
        name:       'lieutenant'
        locked:     true
        image_path: 'images/achievements/sergeant.png'
        date:       null
      },
      {
        name:       'chief'
        locked:     true
        image_path: 'images/achievements/chief.png'
        date:       null
      }
    ]

  $scope.awardData = [
    {
      name:             'commendation',
      locked:           true,
      image_path:       'images/awards/commendation-small.png',
      badge_image_path: 'images/awards/commendation-badge.png',
      video_path:       '',
      level:            null,
      date:             null,
      message:          'Wow! Having completed your first case, you have achieved the Commendation award. Keep up the great work.'
    },
    {
      name:             'medal',
      locked:           true,
      image_path:       'images/awards/medal-small.png',
      badge_image_path: 'images/awards/medal-badge.png',
      video_path:       '',
      level:            null,
      date:             null,
      message:          "Great! Having completed your first advice, you've achieved the Medal award, keep it up!"
    },
    {
      name:             'award',
      locked:           true,
      image_path:       'images/awards/award-small.png',
      badge_image_path: 'images/awards/award-badge.png',
      video_path:       '',
      level:            0,
      date:             null,
      message:          "Awesome! For completing five cases, you've earned an Award, keep going!"
    },
    {
      name:             'cross',
      locked:           true,
      image_path:       'images/awards/cross-small.png',
      badge_image_path: 'images/awards/cross-badge.png',
      video_path:       '',
      level:            0,
      date:             null,
      message:          "Nice! You've earned a Cross award for receiving 100 points from advice!"
    },
    {
      name:             'star',
      locked:           true,
      image_path:       'images/awards/star-small.png',
      badge_image_path: 'images/awards/star-badge.png',
      video_path:       '',
      level:            0,
      date:             null,
      message:          "Great job! You've been awarded a Star for completing six different pain recommendations!"
    }
  ]

  $ionicModal.fromTemplateUrl "templates/achievements/modal.award.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadAwardModal = (item) ->
    $scope.selectedItem = item
    $scope.modal.show() unless item.locked

  $scope.closeModal = ->
    $scope.modal.hide()
    reset()

  $scope.next = ->
    $ionicSlideBoxDelegate.next();

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous();

  $scope.getImage = (item) ->
    if item.locked
      'background-image': 'url(images/awards/locked.gif)'
    else
      'background-image': 'url(' + item.image_path + ')'

  reset = ->
    $scope.selectedItem = {}

  mergeRankData = ->
    for item, index in achievements.ranks
      unlockItem($scope.achievementData[index], item)

  unlockItem = (listItem, item) ->
    if listItem
      listItem.locked = false
      listItem.date  = moment(item.created_at).format('ll')

  setAwardLevelsAndDates = ->
    for item in $scope.awardData
      switch item.name
        when 'award'
          debugger
          item.level = achievements.award_level if achievements.award_level
          item.date  = moment(achievements.latest_award_date).format('ll') if achievements.latest_award_date
        when 'cross'
          item.level = achievements.cross_level
          item.date  = moment(achievements.latest_cross_date).format('ll') if achievements.latest_cross_date
        when 'star'
          item.level = achievements.star_level
          item.date  = moment(achievements.latest_star_date).format('ll') if achievements.latest_star_date

  mergeRankData()
  setAwardLevelsAndDates()

@AchievementsCtrl.$inject = ['$scope', '$state', '$ionicSlideBoxDelegate', '$ionicModal', 'moment', 'achievements']
