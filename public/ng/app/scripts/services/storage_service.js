'use strict';

// simple service to store user credentials in local storage
var StorageService = (function() {
  function StorageService() {}

  StorageService.prototype.store = function(key, value) {
    localStorage.setItem(key, value);
  };

  StorageService.prototype.get = function(key) {
    localStorage.getItem(key);
  };

  StorageService.prototype.deleteItem = function(key) {
    localStorage.removeItem(key);
  };

  StorageService.prototype.logout = function() {
    localStorage.removeItem("email");
    localStorage.removeItem("token");
  };

  return StorageService;

})();

angular.module('painSquad.storageService', [], function($provide) {
  return $provide.factory('storageService', ['$http', function($http) {
      return new StorageService($http);
    }
  ]);
});
