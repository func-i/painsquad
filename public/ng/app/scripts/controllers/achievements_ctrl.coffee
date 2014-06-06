'use strict'

@AchievementsCtrl = @controllerModule.controller 'AchievementsCtrl', ($scope, $state, $ionicSlideBoxDelegate, $ionicModal, moment, achievements) ->
  $scope.selectedAward = {}

  $ionicModal.fromTemplateUrl "templates/achievements/modal.award.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.achievementData = [
      {
        name:       'rookie'
        locked:     true
        image_path: 'images/achievements/01-rookie.png'
        date:       null
      },
      {
        name:       'junior_detective'
        locked:     true
        image_path: 'images/achievements/02-jrdetective.png'
        date:       null
      },
      {
        name:       'detective'
        locked:     true
        image_path: 'images/achievements/03-detective.png'
        date:       null
      },
      {
        name:       'sergeant'
        locked:     true
        image_path: 'images/achievements/04-lieutenant.png'
        date:       null
      },
      {
        name:       'lieutenant'
        locked:     true
        image_path: 'images/achievements/05-sergeant.png'
        date:       null
      },
      {
        name:       'chief'
        locked:     true
        image_path: 'images/achievements/06-chief.png'
        date:       null
      }
    ]

  $scope.awardData = [
    {
      name:       'commendation',
      locked:     true,
      image_path: 'images/awards/commendation-small.png',
      video_path: '',
      level:      null,
      date:       null
    },
    {
      name:       'medal',
      locked:     true,
      image_path: 'images/awards/medal-small.png',
      video_path: '',
      level:      null,
      date:       null
    },
    {
      name:       'award',
      locked:     true,
      image_path: 'images/awards/award-small.png',
      video_path: '',
      level:      0,
      date:       null
    },
    {
      name:       'cross',
      locked:     true,
      image_path: 'images/awards/cross-small.png',
      video_path: '',
      level:      0,
      date:       null
    },
    {
      name:       'star',
      locked:     true,
      image_path: 'images/awards/star-small.png',
      video_path: '',
      level:      0,
      date:       null
    }
  ]

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
      # TODO: need 'locked' images
      'border': '5px dotted black'
    else
      'background-image': 'url(' + item.image_path + ')'

  reset = ->
    $scope.selectedItem = {}

  mergeAchievementData = ->
    for item, index in achievements.ranks
      unlockAchievement($scope.achievementData[index], item)

  mergeAwardData = ->
    for item, index in achievements.awards
      unlockAward($scope.awardData[index], item)

  unlockAchievement = (achievement, item) ->
    achievement.locked = false
    achievement.date   = moment(item.created_at).format('ll')

  unlockAward = (award, item) ->
    award.locked = false
    award.date   = moment(item.created_at).format('ll')

  mergeAchievementData()
  # mergeAwardData()

@AchievementsCtrl.$inject = ['$scope', '$state', '$ionicSlideBoxDelegate', '$ionicModal', 'moment', 'achievements']
