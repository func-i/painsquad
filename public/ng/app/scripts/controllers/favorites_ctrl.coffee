'use strict'

@FavoritesCtrl = @controllerModule.controller 'FavoritesCtrl',  ($state, $scope, UserService, FavoritesResource) ->
  $scope.currentUser = UserService.currentUser()
  $scope.isLoggedIn  = UserService.isLoggedIn()
  $scope.favorites   = FavoritesResource.favorites


@FavoritesCtrl.$inject = [ '$state', '$scope', 'UserService', 'FavoritesResource' ]

@FavoritesCtrl.resolve =
  FavoritesResource: (Favorites) ->
    Favorites.query().$promise
