(function() {
  'use strict';
  this.RecommendationsModalCtrl = this.controllerModule.controller('RecommendationsModalCtrl', function($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, $interval, Favorites, Activity) {
    var closeModal, initAudio, onAudioError, onAudioSuccess, reset, setHeaderButtons;
    $scope.selectedItem = {};
    $scope.audio = null;
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
      if (!$scope.audio) {
        initAudio(src);
      }
      if ($scope.mediaPlaying) {
        $scope.audio.pause();
        return $scope.mediaPlaying = !$scope.mediaPlaying;
      } else {
        $scope.audio.play();
        return $scope.mediaPlaying = !$scope.mediaPlaying;
      }
    };
    initAudio = function(src) {
      return $scope.audio = new Media(src, onAudioSuccess, onAudioError);
    };
    onAudioSuccess = function() {
      return console.log("playAudio():Audio Success");
    };
    onAudioError = function(error) {
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
      $scope.selectedItem = null;
      if ($scope.audio) {
        $scope.audio.stop();
        return $scope.audio.release();
      }
    };
  });

  this.RecommendationsModalCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', '$interval', 'Favorites', 'Activity'];

}).call(this);
