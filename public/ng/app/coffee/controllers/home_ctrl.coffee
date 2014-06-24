'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, $rootScope, $ionicPopup, $timeout, UserService, userScore) ->
  $scope.currentUser = UserService.currentUser()
  $scope.userScore   = userScore
  $scope.rankBadge   = if userScore then "images/achievements/#{userScore.rank}.png" else "images/achievements/rookie.png"

  $rootScope.sideMenuEnabled = true

  # $scope.showPopup = ->
  #   confirmPopup = $ionicPopup.confirm
  #     title:    'Do you want pain management advice?'
  #     template: 'Get recommended advice based on your pain case'
  #   confirmPopup.then (res) ->
  #     if res
  #       console.log 'OK clicked'
  #       # $state.go ''
  #     else
  #       console.log 'Cancel clicked '

  $scope.showPopup = ->
    confirmPopup = $ionicPopup.show
      title:    'Do you want pain management advice?'
      template: '<div>Get recommended advice based on your pain case</div>'
      buttons:  [
        {
          text: 'No'
          type: 'button-default'
        },
        {
          text: 'Yes'
          type: 'button-positive'
          onTap: (ev) ->
            $state.go 'app.recommended'
            disableListener()
        }
      ]

    # # close popup after 3 seconds, sometimes event is fired more than once
    # $timeout ->
    #   confirmPopup.close()
    # , 2000

  popupListener = $rootScope.$on 'surveyComplete', (ev) ->
    $scope.showPopup()
    disableListener()

  disableListener = ->
    popupListener()

@HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore']
