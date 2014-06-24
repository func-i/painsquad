'use strict'

@RecommendationsCtrl = @controllerModule.controller 'RecommendationsCtrl', ($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, recommendations, Favorites, Activity) ->
  $scope.recommendations = recommendations

  $scope.toggleFavorite = (item) ->
    item.favorite = !item.favorite
    if item.favorite
      Favorites.save(favorite: { recommendation_id: item.id })
    else
      Favorites.remove(recommendation_id: item.id)

@RecommendationsCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'recommendations', 'Favorites', 'Activity']
