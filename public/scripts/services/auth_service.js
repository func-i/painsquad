(function() {
  'use strict';
  this.AuthService = this.serviceModule.factory('AuthService', function($state, $http, $ionicLoading, Session, UserService) {
    return {
      login: function(credentials) {
        this.showLoading();
        return Session.save({
          session: credentials
        }).$promise.then((function(_this) {
          return function(response) {
            return _this.onSuccess(response);
          };
        })(this), (function(_this) {
          return function(error) {
            return _this.onError(error);
          };
        })(this));
      },
      onSuccess: function(responseData) {
        this.hideLoading();
        UserService.set(responseData.user);
        $http.defaults.headers.common['Authorization'] = "Token token=" + responseData.user.access_token;
        return $state.go('app.home');
      },
      onError: function(errorData) {
        this.hideLoading();
        return console.log(errorData.data);
      },
      showLoading: function() {
        return $ionicLoading.show({
          template: "Loading..."
        });
      },
      hideLoading: function() {
        return $ionicLoading.hide();
      }
    };
  });

  this.AuthService.$inject = ['$state', '$http', '$ionicModal', 'Session', 'UserService'];

}).call(this);
