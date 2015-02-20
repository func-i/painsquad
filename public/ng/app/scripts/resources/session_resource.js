(function() {
  'use strict';
  this.SessionResource = this.resourceModule.factory('Session', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource(CONFIG.apiUrl + "/session/", {});
  });

  this.SessionResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
