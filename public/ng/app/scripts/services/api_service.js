'use strict';

var ApiService = (function() {
  function ApiService($http) {
    this.$http = $http;
    this.baseUrl = '/api/v1/';
  }

  ApiService.prototype.getGreeting = function() {
    return this.$http.get(this.baseUrl + 'greet', {});
  };

  ApiService.prototype.getThings = function() {
    return this.$http.get(this.baseUrl + 'things', {});
  };

  return ApiService;

  // ApiService.prototype.login = function(user) {
  //   return this.$http.post(this.baseUrl + 'login', {
  //     user: {
  //       email: user.email,
  //       password: user.password
  //     }
  //   });
  // };

  // ApiService.prototype.getAuthHeaders = function() {
  //   return {
  //     email: this.storageService.get('email'),
  //     token: this.storageService.get('token')
  //   };
  // };

  // ApiService.prototype.logout = function() {
  //   return this.$http['delete'](this.baseUrl + 'logout', {
  //     headers: this.getAuthHeaders()
  //   });
  // };

  // ApiService.prototype.getGreeting = function() {
  //   return this.$http.get(this.baseUrl + 'greet', {
  //     headers: this.getAuthHeaders()
  //   });
  // };

})();

angular.module('painSquad.apiService', [], function($provide) {
  return $provide.factory('apiService', ['$http', function($http) {
      return new ApiService($http);
    }
  ]);
});
