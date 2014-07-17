(function() {
  'use strict';
  this.SettingResource = this.resourceModule.factory('Setting', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/settings/", {}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  });

  this.SettingResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
