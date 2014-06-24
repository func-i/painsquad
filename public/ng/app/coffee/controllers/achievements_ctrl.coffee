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
      date:             null
    },
    {
      name:             'medal',
      locked:           true,
      image_path:       'images/awards/medal-small.png',
      badge_image_path: 'images/awards/medal-badge.png',
      video_path:       '',
      level:            null,
      date:             null
    },
    {
      name:             'award',
      locked:           true,
      image_path:       'images/awards/award-small.png',
      badge_image_path: 'images/awards/award-badge.png',
      video_path:       '',
      level:            0,
      date:             null
    },
    {
      name:             'cross',
      locked:           true,
      image_path:       'images/awards/cross-small.png',
      badge_image_path: 'images/awards/cross-badge.png',
      video_path:       '',
      level:            0,
      date:             null
    },
    {
      name:             'star',
      locked:           true,
      image_path:       'images/awards/star-small.png',
      badge_image_path: 'images/awards/star-badge.png',
      video_path:       '',
      level:            0,
      date:             null
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

  mergeData = ->
    for item, index in achievements.ranks
      unlockItem($scope.achievementData[index], item)
    for item, index in achievements.awards
      unlockItem($scope.awardData[index], item)

  unlockItem = (listItem, item) ->
    try
      listItem.locked = false
      listItem.date   = moment(item.created_at).format('ll')
    catch typeError
      console.log 'Error trying to unlock: ', item
      console.log 'Error with listItem: ', listItem

  setLevels = ->
    for item in $scope.awardData
      switch item.name
        when 'award'
          item.level = achievements.award_level
        when 'cross'
          item.level = achievements.cross_level
        when 'star'
          item.level = achievements.star_level

  mergeData()
  setLevels()

@AchievementsCtrl.$inject = ['$scope', '$state', '$ionicSlideBoxDelegate', '$ionicModal', 'moment', 'achievements']
