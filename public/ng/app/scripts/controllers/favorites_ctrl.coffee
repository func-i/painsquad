'use strict'

@FavoritesCtrl = @controllerModule.controller 'FavoritesCtrl',  ($state, $scope, UserService, favorites) ->
  $scope.currentUser = UserService.currentUser()
  $scope.isLoggedIn  = UserService.isLoggedIn()


@FavoritesCtrl.$inject = [ '$state', '$scope', 'UserService', 'favorites' ]