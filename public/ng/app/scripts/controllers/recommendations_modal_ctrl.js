(function() {
  'use strict';
  this.RecommendationsModalCtrl = this.controllerModule.controller('RecommendationsModalCtrl', function($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, Favorites, Activity) {
    var closeModal, onError, onSuccess, reset, setAudioPosition, setHeaderButtons;
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
      var mediaTimer, my_media;
      src = "..images/advice/audio/" + src + ".mp3";
      my_media = new Media(src, onSuccess, onError);
      my_media.play();
      if (typeof mediaTimer === "undefined" || mediaTimer === null) {
        return mediaTimer = setInterval(function() {
          return my_media.getCurrentPosition((function(position) {
            if (position > -1) {
              return setAudioPosition(position + " sec");
            }
          }), function(e) {
            console.log("Error getting pos=" + e);
            return setAudioPosition("Error: " + e);
          });
        }, 1000);
      }
    };
    $scope.pauseAudio = function() {
      if (my_media) {
        return my_media.pause();
      }
    };
    $scope.stopAudio = function() {
      var mediaTimer;
      if (my_media) {
        my_media.stop();
      }
      clearInterval(mediaTimer);
      return mediaTimer = null;
    };
    setAudioPosition = function(position) {
      return document.getElementById("audio_position").innerHTML = position;
    };
    onSuccess = function() {
      return console.log("playAudio():Audio Success");
    };
    onError = function(error) {
      return alert("code: " + error.code + "\n" + "message: " + error.message + "\n");
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
