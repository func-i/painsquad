(function() {
  'use strict';
  this.ReportResource = this.resourceModule.factory('Report', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/reports/:report_id", {});
  });

  this.ReportResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
