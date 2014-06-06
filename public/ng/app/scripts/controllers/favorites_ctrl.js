(function() {
  'use strict';
  this.FavoritesCtrl = this.controllerModule.controller('FavoritesCtrl', function($state, $scope, $ionicModal, $ionicSlideBoxDelegate, $timeout, favorites, Favorites, Activity) {
    var reset, setHeaderButtons;
    $scope.favorites = favorites;
    $scope.isFavorites = $scope.favorites.length > 0;
    $scope.selectedItem = {};
    $ionicModal.fromTemplateUrl("templates/advice/modal.base.html", function(modal) {
      return $scope.modal = modal;
    }, {
      animation: "slide-in-up",
      scope: $scope
    });
    $scope.$on('$destroy', function() {
      return $scope.modal.remove();
    });
    $scope.loadAdviceModal = function(item) {
      if (event.target.tagName.toLowerCase() === 'i') {
        return $scope.toggleFavorite(item);
      } else {
        $scope.modalStyle = item.style;
        setHeaderButtons(item);
        $scope.selectedItem = item;
        return $scope.modal.show();
      }
    };
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
    $scope.removeItem = function(item_id) {
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
    $scope.startSlideshow = function() {
      $scope.slideIndex = 0;
      $scope.showStartButton = false;
      $scope.showDidItButton = true;
      $scope.slideShowActivated = true;
      return $timeout(function() {
        $ionicSlideBoxDelegate.update();
        return $ionicSlideBoxDelegate.slide(0);
      });
    };
    $scope.slideChange = function(index) {
      return $scope.slideIndex = index;
    };
    $scope.adviceCompleted = function() {
      Activity.save({
        activity: {
          subject_id: $scope.selectedItem.id,
          subject_type: 'Recommendation',
          event: 'recommendation_complete'
        }
      });
      $scope.modal.hide();
      return reset();
    };
    $scope.discardAdvice = function() {
      $scope.modal.hide();
      return reset();
    };
    setHeaderButtons = function(item) {
      if (item.style === 'slideshow') {
        return $scope.showStartButton = true;
      } else {
        return $scope.showDidItButton = true;
      }
    };
    return reset = function() {
      $scope.slideShowActivated = null;
      $scope.selectedItem = null;
      $scope.modalStyle = null;
      $scope.showStartButton = null;
      return $scope.showDidItButton = null;
    };
  });

  this.FavoritesCtrl.$inject = ['$state', '$scope', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'favorites', 'Favorites', 'Activity'];

}).call(this);
