'use strict'

@FavoritesCtrl = @controllerModule.controller 'FavoritesCtrl',  ($state, $scope, $ionicModal, $ionicSlideBoxDelegate, $timeout, favorites, Favorites, Activity) ->
  $scope.favorites          = favorites
  $scope.isFavorites        = $scope.favorites.length > 0
  $scope.selectedItem       = {}

  $scope.toggleFavorite = (item) ->
    item.favorite = !item.favorite
    if item.favorite
      Favorites.save(favorite: { recommendation_id: item.id })
    else
      Favorites.remove(recommendation_id: item.id)
      # $scope.removeItem(item.id)

  $scope.removeItem = (item_id) ->
    $scope.favorites.splice(index, 1) for index, value of $scope.favorites when value.recommendation_id is item_id

@FavoritesCtrl.$inject = [ '$state', '$scope', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'favorites', 'Favorites', 'Activity']
