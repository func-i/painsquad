'use strict';

// wrapper for external api
var ApiService = (function() {
  function ApiService($http, storageService) {
    this.$http          = $http;
    this.storageService = storageService;
    this.baseUrl        = 'http://localhost:3000/api/v1/';
  }

  ApiService.prototype.login = function(user) {
    return this.$http.post(this.baseUrl + 'login', {
      user: {
        email:    user.email,
        password: user.password
      }
    });
  };

  ApiService.prototype.getAuthHeaders = function() {
    return {
      email: this.storageService.get('email'),
      token: this.storageService.get('token')
    };
  };

  ApiService.prototype.logout = function() {
    return this.$http['delete'](this.baseUrl + 'logout', {
      headers: this.getAuthHeaders()
    });
  };

  ApiService.prototype.getGreeting = function() {
    return this.$http.get(this.baseUrl + 'greet', {});

    // return this.$http.get(this.baseUrl + 'greet', {
    //   headers: this.getAuthHeaders()
    // });
  };

  ApiService.prototype.getThings = function() {
    return this.$http.get(this.baseUrl + 'things', {
      headers: this.getAuthHeaders()
    });
  };

  ApiService.prototype.getThing = function(id) {
    return this.$http.get(this.baseUrl + 'things/' + id, {
      headers: this.getAuthHeaders()
    });
  };

  return ApiService;

})();

angular.module('painSquad.apiService', [], function($provide) {
  return $provide.factory('apiService', ['$http', 'storageService', function($http, storageService) {
      return new ApiService($http, storageService);
    }
  ]);
});
