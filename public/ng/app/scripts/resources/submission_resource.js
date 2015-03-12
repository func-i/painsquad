(function() {
  this.resourceModule.factory('SubmissionResource', [
    '$http', '$resource', 'CONFIG', function($http, $resource, CONFIG) {
      $http.defaults.useXDomain = true;
      return $resource("" + CONFIG.apiUrl + "/submissions", {});
    }
  ]);

}).call(this);
