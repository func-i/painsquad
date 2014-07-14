(function() {
  'use strict';
  this.RecommendationsModalCtrl = this.controllerModule.controller('RecommendationsModalCtrl', function($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, AudioPlayer, Favorites, Activity) {
    var closeModal, resetState, setHeaderButtons;
    $scope.selectedItem = {};
    $scope.showInit = true;
    $scope.player = AudioPlayer;
    $scope.mediaPlaying = false;
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
      if (event.target.tagName.toLowerCase() === 'i' || event.target.className.toLowerCase() === 'badge') {
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
    $scope.initAudio = function(src) {
      $scope.player.initAudio(src);
      $scope.player.play();
      $scope.showInit = false;
      return $scope.mediaPlaying = true;
    };
    $scope.pauseAudio = function() {
      $scope.player.pause();
      return $scope.mediaPlaying = false;
    };
    $scope.resumeAudio = function() {
      $scope.player.play();
      return $scope.mediaPlaying = true;
    };
    $scope.stopAudio = function() {
      $scope.player.stop();
      return $scope.mediaPlaying = false;
    };
    $scope.discardAdvice = function() {
      return closeModal();
    };
    $scope.$watch((function() {
      return AudioPlayer.progress;
    }), (function(newVal, oldVal) {
      console.log(newVal);
      return console.log(oldVal);
    }), true);
    closeModal = function() {
      $scope.modal.hide();
      $scope.stopAudio();
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

  this.RecommendationsModalCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'AudioPlayer', 'Favorites', 'Activity'];

}).call(this);
