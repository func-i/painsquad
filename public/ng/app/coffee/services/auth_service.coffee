'use strict'

@AuthService = @serviceModule.factory 'AuthService', ($state, $http, $ionicLoading, Session, UserService) ->

  login: (credentials) ->
    @showLoading()
    Session.save(session: credentials).$promise
      .then (response) =>
        @onSuccess(response)
      , (error) =>
        @onError(error)

  onSuccess: (responseData) ->
    @hideLoading()
    # sets user in localstorage
    UserService.set(responseData.user)
    # adds token to headers
    $http.defaults.headers.common['Authorization'] = "Token token=#{responseData.user.access_token}"
    # go to home view!
    $state.go 'app.home'

  # handle errors here somehow idk maybe like show stuff to user
  onError: (errorData) ->
    @hideLoading()
    console.log errorData.data

  showLoading: ->
    $ionicLoading.show
      template: "Loading..."

  hideLoading: ->
    $ionicLoading.hide()

@AuthService.$inject = ['$state', '$http', '$ionicModal', 'Session', 'UserService']