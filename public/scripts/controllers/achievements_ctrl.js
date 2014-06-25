(function() {
  'use strict';
  this.AchievementsCtrl = this.controllerModule.controller('AchievementsCtrl', function($scope, $state, $ionicSlideBoxDelegate, $ionicModal, moment, achievements) {
    var mergeData, reset, setLevels, unlockItem;
    $scope.selectedAward = {};
    $ionicModal.fromTemplateUrl("templates/achievements/modal.award.html", function(modal) {
      return $scope.modal = modal;
    }, {
      animation: "slide-in-up",
      scope: $scope
    });
    $scope.$on('$destroy', function() {
      return $scope.modal.remove();
    });
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
        date: null
      }, {
        name: 'medal',
        locked: true,
        image_path: 'images/awards/medal-small.png',
        badge_image_path: 'images/awards/medal-badge.png',
        video_path: '',
        level: null,
        date: null
      }, {
        name: 'award',
        locked: true,
        image_path: 'images/awards/award-small.png',
        badge_image_path: 'images/awards/award-badge.png',
        video_path: '',
        level: 0,
        date: null
      }, {
        name: 'cross',
        locked: true,
        image_path: 'images/awards/cross-small.png',
        badge_image_path: 'images/awards/cross-badge.png',
        video_path: '',
        level: 0,
        date: null
      }, {
        name: 'star',
        locked: true,
        image_path: 'images/awards/star-small.png',
        badge_image_path: 'images/awards/star-badge.png',
        video_path: '',
        level: 0,
        date: null
      }
    ];
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
          'border': '5px dotted black'
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
    mergeData = function() {
      var index, item, _i, _j, _len, _len1, _ref, _ref1, _results;
      _ref = achievements.awards;
      for (index = _i = 0, _len = _ref.length; _i < _len; index = ++_i) {
        item = _ref[index];
        unlockItem($scope.awardData[index], item);
      }
      _ref1 = achievements.ranks;
      _results = [];
      for (index = _j = 0, _len1 = _ref1.length; _j < _len1; index = ++_j) {
        item = _ref1[index];
        _results.push(unlockItem($scope.achievementData[index], item));
      }
      return _results;
    };
    unlockItem = function(listItem, item) {
      if (listItem == null) {
        debugger;
      }
      if (item == null) {
        debugger;
      }
      listItem.locked = false;
      return listItem.date = moment(item.created_at).format('ll');
    };
    setLevels = function() {
      var item, _i, _len, _ref, _results;
      _ref = $scope.awardData;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        switch (item.name) {
          case 'award':
            _results.push(item.level = achievements.award_level);
            break;
          case 'cross':
            _results.push(item.level = achievements.cross_level);
            break;
          case 'star':
            _results.push(item.level = achievements.star_level);
            break;
          default:
            _results.push(void 0);
        }
      }
      return _results;
    };
    mergeData();
    return setLevels();
  });

  this.AchievementsCtrl.$inject = ['$scope', '$state', '$ionicSlideBoxDelegate', '$ionicModal', 'moment', 'achievements'];

}).call(this);
