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
        Favorites.remove({
          recommendation_id: item.id
        });
        return $scope.removeItem(item.id);
      }
    };
    return $scope.removeItem = function(item_id) {
      var index, value, _ref, _results;
      _ref = $scope.favorites;
      _results = [];
      for (index in _ref) {
        value = _ref[index];
        if (value.recommendation_id === item_id) {
          _results.push($scope.favorites.splice(index, 1));
        }
      }
      return _results;
    };
  });

  this.FavoritesCtrl.$inject = ['$state', '$scope', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'favorites', 'Favorites', 'Activity'];

}).call(this);
