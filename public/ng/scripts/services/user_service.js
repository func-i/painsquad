(function() {
  'use strict';
  this.UserService = this.serviceModule.factory('UserService', function($http) {
    return {
      isLoggedIn: function() {
        return this.currentUser() != null;
      },
      currentUser: function() {
        return JSON.parse(this.get());
      },
      get: function() {
        return localStorage.getItem('current_user');
      },
      set: function(user) {
        this.remove();
        return localStorage.setItem('current_user', JSON.stringify(user));
      },
      remove: function() {
        return localStorage.removeItem('current_user');
      },
      clearToken: function() {
        return $http.defaults.headers.common['Authorization'] = '';
      }
    };
  });

  this.UserService.$inject = ['$http'];

}).call(this);
