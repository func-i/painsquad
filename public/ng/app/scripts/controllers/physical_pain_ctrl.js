(function() {
  'use strict';
  this.PhysicalPainCtrl = this.controllerModule.controller('PhysicalPainCtrl', function($scope, PainService, Favorites) {
    $scope.recommendations = PainService.getItems('physical');
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

  this.PhysicalPainCtrl.$inject = ['$scope', 'PainService', 'Favorites'];

}).call(this);
