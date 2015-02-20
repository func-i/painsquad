(function() {
  this.AchievementResource = this.resourceModule.factory('Achievement', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource(CONFIG.apiUrl + "/achievements", {}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  });

  this.AchievementResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
