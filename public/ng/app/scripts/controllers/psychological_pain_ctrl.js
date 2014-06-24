(function() {
  'use strict';
  this.PsychologicalPainCtrl = this.controllerModule.controller('PsychologicalPainCtrl', function($scope, PainService, Favorites) {
    $scope.recommendations = PainService.getItems('psychological');
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

  this.PsychologicalPainCtrl.$inject = ['$scope', 'PainService', 'Favorites'];

}).call(this);
