(function() {
  'use strict';
  this.FavoritesCtrl = this.controllerModule.controller('FavoritesCtrl', function($state, $scope, $ionicModal, $ionicSlideBoxDelegate, $timeout, favorites, Favorites, Activity) {
    $scope.favorites = favorites;
    $scope.isFavorites = $scope.favorites.length > 0;
    $scope.selectedItem = {};
    $scope.toggleFavorite = function(item) {
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
    return $scope.removeItem = function(item_id) {
      var index, ref, results, value;
      ref = $scope.favorites;
      results = [];
      for (index in ref) {
        value = ref[index];
        if (value.recommendation_id === item_id) {
          results.push($scope.favorites.splice(index, 1));
        }
      }
      return results;
    };
  });

  this.FavoritesCtrl.$inject = ['$state', '$scope', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'favorites', 'Favorites', 'Activity'];

}).call(this);
