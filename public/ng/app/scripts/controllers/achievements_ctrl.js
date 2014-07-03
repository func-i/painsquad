(function() {
  'use strict';
  this.AchievementsCtrl = this.controllerModule.controller('AchievementsCtrl', function($scope, $state, $ionicSlideBoxDelegate, $ionicModal, moment, achievements) {
    var mergeRankData, reset, unlockAwardsAndSetDates, unlockItem;
    $scope.selectedAward = {};
    $scope.achievementData = [
      {
        name: 'rookie',
        locked: true,
        image_path: 'images/achievements/rookie.png',
        date: null
      }, {
        name: 'junior_detective',
        locked: true,
        image_path: 'images/achievements/junior_detective.png',
        date: null
      }, {
        name: 'detective',
        locked: true,
        image_path: 'images/achievements/detective.png',
        date: null
      }, {
        name: 'sergeant',
        locked: true,
        image_path: 'images/achievements/lieutenant.png',
        date: null
      }, {
        name: 'lieutenant',
        locked: true,
        image_path: 'images/achievements/sergeant.png',
        date: null
      }, {
        name: 'chief',
        locked: true,
        image_path: 'images/achievements/chief.png',
        date: null
      }
    ];
    $scope.awardData = [
      {
        name: 'commendation',
        locked: true,
        image_path: 'images/awards/commendation-small.png',
        badge_image_path: 'images/awards/commendation-badge.png',
        video_path: '',
        level: null,
        date: null,
        message: 'Wow! Having completed your first case, you have achieved the Commendation award. Keep up the great work.'
      }, {
        name: 'medal',
        locked: true,
        image_path: 'images/awards/medal-small.png',
        badge_image_path: 'images/awards/medal-badge.png',
        video_path: '',
        level: null,
        date: null,
        message: "Great! Having completed your first advice, you've achieved the Medal award, keep it up!"
      }, {
        name: 'award',
        locked: true,
        image_path: 'images/awards/award-small.png',
        badge_image_path: 'images/awards/award-badge.png',
        video_path: '',
        level: 0,
        date: null,
        message: "Awesome! For completing five cases, you've earned an Award, keep going!"
      }, {
        name: 'cross',
        locked: true,
        image_path: 'images/awards/cross-small.png',
        badge_image_path: 'images/awards/cross-badge.png',
        video_path: '',
        level: 0,
        date: null,
        message: "Nice! You've earned a Cross award for receiving 100 points from advice!"
      }, {
        name: 'star',
        locked: true,
        image_path: 'images/awards/star-small.png',
        badge_image_path: 'images/awards/star-badge.png',
        video_path: '',
        level: 0,
        date: null,
        message: "Great job! You've been awarded a Star for completing six different pain recommendations!"
      }
    ];
    $ionicModal.fromTemplateUrl("templates/achievements/modal.award.html", function(modal) {
      return $scope.modal = modal;
    }, {
      animation: "slide-in-up",
      scope: $scope
    });
    $scope.$on('$destroy', function() {
      return $scope.modal.remove();
    });
    $scope.loadAwardModal = function(item) {
      $scope.selectedItem = item;
      if (!item.locked) {
        return $scope.modal.show();
      }
    };
    $scope.closeModal = function() {
      $scope.modal.hide();
      return reset();
    };
    $scope.next = function() {
      return $ionicSlideBoxDelegate.next();
    };
    $scope.previous = function() {
      return $ionicSlideBoxDelegate.previous();
    };
    $scope.getImage = function(item) {
      if (item.locked) {
        return {
          'background-image': 'url(images/awards/locked.gif)'
        };
      } else {
        return {
          'background-image': 'url(' + item.image_path + ')'
        };
      }
    };
    reset = function() {
      return $scope.selectedItem = {};
    };
    mergeRankData = function() {
      var index, item, _i, _len, _ref, _results;
      _ref = achievements.ranks;
      _results = [];
      for (index = _i = 0, _len = _ref.length; _i < _len; index = ++_i) {
        item = _ref[index];
        _results.push(unlockItem($scope.achievementData[index], item));
      }
      return _results;
    };
    unlockItem = function(listItem, item) {
      if (listItem) {
        listItem.locked = false;
        return listItem.date = moment(item.created_at).format('ll');
      }
    };
    unlockAwardsAndSetDates = function() {
      var item, _i, _len, _ref, _results;
      _ref = $scope.awardData;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        switch (item.name) {
          case 'commendation':
            if (achievements.commendation) {
              item.locked = false;
              _results.push(item.date = moment(achievements.commendation_date).format('ll'));
            } else {
              _results.push(void 0);
            }
            break;
          case 'medal':
            if (achievements.medal) {
              item.locked = false;
              _results.push(item.date = moment(achievements.medal_date).format('ll'));
            } else {
              _results.push(void 0);
            }
            break;
          case 'award':
            if (achievements.award_level > 0) {
              item.locked = false;
              item.level = achievements.award_level;
              _results.push(item.date = moment(achievements.latest_award_date).format('ll'));
            } else {
              _results.push(void 0);
            }
            break;
          case 'cross':
            if (achievements.cross_level > 0) {
              item.locked = false;
              item.level = achievements.cross_level;
              _results.push(item.date = moment(achievements.latest_cross_date).format('ll'));
            } else {
              _results.push(void 0);
            }
            break;
          case 'star':
            if (achievements.star_level > 0) {
              item.locked = false;
              item.level = achievements.star_level;
              _results.push(item.date = moment(achievements.latest_star_date).format('ll'));
            } else {
              _results.push(void 0);
            }
            break;
          default:
            _results.push(void 0);
        }
      }
      return _results;
    };
    mergeRankData();
    return unlockAwardsAndSetDates();
  });

  this.AchievementsCtrl.$inject = ['$scope', '$state', '$ionicSlideBoxDelegate', '$ionicModal', 'moment', 'achievements'];

}).call(this);
