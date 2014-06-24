(function() {
  'use strict';
  this.RecommendationsCtrl = this.controllerModule.controller('RecommendationsCtrl', function($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, recommendations, Favorites, Activity) {
    $scope.recommendations = recommendations;
    return $scope.toggleFavorite = function(item) {
      item.favorite = !item.favorite;
      if (item.favorite) {
        return Favorites.save({
          favorite: {
            recommendation_id: item.id
          }
        });
      } else {
        return Favorites.remove({
          recommendation_id: item.id
        });
      }
    };
  });

  this.RecommendationsCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'recommendations', 'Favorites', 'Activity'];

}).call(this);
