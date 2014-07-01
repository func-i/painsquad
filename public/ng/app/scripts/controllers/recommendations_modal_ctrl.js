(function() {
  'use strict';
  this.RecommendationsModalCtrl = this.controllerModule.controller('RecommendationsModalCtrl', function($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, Favorites, Activity) {
    var closeModal, onError, onSuccess, reset, setHeaderButtons;
    $scope.selectedItem = {};
    $ionicModal.fromTemplateUrl("templates/advice/modal.base.html", function(modal) {
      return $scope.modal = modal;
    }, {
      animation: "slide-in-up",
      scope: $scope
    });
    $scope.$on('$destroy', function() {
      $scope.modal.remove();
      if ($scope.audio) {
        $scope.audio.stop();
        return $scope.audio.release();
      }
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
    $scope.discardAdvice = function() {
      return closeModal();
    };
    $scope.playAudio = function(src) {
      src = "./images/advice/audio/" + src + ".mp3";
      $scope.audio = new Media(src, onSuccess, onError);
      if ($scope.mediaPlaying) {
        $scope.audio.pause();
        return $scope.mediaPlaying = !$scope.mediaPlaying;
      } else {
        $scope.audio.play();
        return $scope.mediaPlaying = !$scope.mediaPlaying;
      }
    };
    $scope.pauseAudio = function() {
      if ($scope.audio && $scope.mediaPlaying) {
        $scope.audio.pause();
        return $scope.mediaPlaying = false;
      }
    };
    onSuccess = function() {
      return console.log("playAudio():Audio Success");
    };
    onError = function(error) {
      return console.log("playAudio():Audio Failure");
    };
    closeModal = function() {
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
      $scope.modalStyle = null;
      $scope.showStartButton = null;
      $scope.showDidItButton = null;
      return $scope.selectedItem = null;
    };
  });

  this.RecommendationsModalCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'Favorites', 'Activity'];

}).call(this);
