'use strict'

@PhysicalPainCtrl = @controllerModule.controller 'PhysicalPainCtrl', ($scope, PainService, Favorites) ->
  $scope.recommendations = PainService.getItems('physical')

  $scope.toggleFavorite = (item) ->
    item.favorite = !item.favorite
    if item.favorite
      Favorites.save(favorite: { recommendation_id: item.id })
    else
      Favorites.remove(recommendation_id: item.id)

@PhysicalPainCtrl.$inject = ['$scope', 'PainService', 'Favorites']
