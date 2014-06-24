(function() {
  'use strict';
  this.PharmacologicalPainCtrl = this.controllerModule.controller('PharmacologicalPainCtrl', function($scope, PainService, Favorites) {
    $scope.recommendations = PainService.getItems('pharmacological');
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

  this.PharmacologicalPainCtrl.$inject = ['$scope', 'PainService', 'Favorites'];

}).call(this);
