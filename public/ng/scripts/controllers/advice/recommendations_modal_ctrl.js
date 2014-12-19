(function() {
  'use strict';
  this.RecommendationsModalCtrl = this.controllerModule.controller('RecommendationsModalCtrl', function($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $ionicScrollDelegate, $timeout, Favorites, Activity) {
    var closeModal, resetState, setHeaderButtons;
    $scope.selectedItem = {};
    $scope.showInit = true;
    $ionicModal.fromTemplateUrl("templates/advice/modal.base.html", function(modal) {
      return $scope.modal = modal;
    }, {
      animation: 'slide-left-right',
      scope: $scope
    });
    $scope.$on('$destroy', function() {
      return $scope.modal.remove();
    });
    $scope.loadAdviceModal = function(item) {
      if (event.target.tagName === 'IMG' && event.target.className === 'fav') {
        return $scope.toggleFavorite(item);
      } else {
        $scope.modalStyle = item.style;
        setHeaderButtons(item);
        $scope.selectedItem = item;
        $scope.modal.show();
        return $ionicScrollDelegate.scrollTop();
      }
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
      return closeModal();
    };
    $scope.initAudio = function(src) {
      return "./images/advice/audio/" + src + ".mp3";
    };
    $scope.discardAdvice = function() {
      return closeModal();
    };
    closeModal = function() {
      $scope.modal.hide();
      return resetState();
    };
    setHeaderButtons = function(item) {
      if (item.style === 'slideshow') {
        return $scope.showStartButton = true;
      } else {
        return $scope.showDidItButton = true;
      }
    };
    return resetState = function() {
      $scope.slideShowActivated = null;
      $scope.modalStyle = null;
      $scope.showStartButton = null;
      $scope.showDidItButton = null;
      return $scope.selectedItem = null;
    };
  });

  this.RecommendationsModalCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$ionicScrollDelegate', '$timeout', 'Favorites', 'Activity'];

}).call(this);
