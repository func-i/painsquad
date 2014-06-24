'use strict'

@PharmacologicalPainCtrl = @controllerModule.controller 'PharmacologicalPainCtrl', ($scope, PainService, Favorites) ->
  $scope.recommendations = PainService.getItems('pharmacological')

  $scope.toggleFavorite = (item) ->
    item.favorite = !item.favorite
    if item.favorite
      Favorites.save(favorite: { recommendation_id: item.id })
    else
      Favorites.remove(recommendation_id: item.id)

@PharmacologicalPainCtrl.$inject = ['$scope', 'PainService', 'Favorites']
