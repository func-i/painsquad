'use strict'

@PsychologicalPainCtrl = @controllerModule.controller 'PsychologicalPainCtrl', ($scope, PainService, Favorites) ->
  $scope.recommendations = PainService.getItems('psychological')

  $scope.toggleFavorite = (item) ->
    item.favorite = !item.favorite
    if item.favorite
      Favorites.save(favorite: { recommendation_id: item.id })
    else
      Favorites.remove(recommendation_id: item.id)

@PsychologicalPainCtrl.$inject = ['$scope', 'PainService', 'Favorites']