(function() {
  this.SurveyResultsResource = this.resourceModule.factory('SurveyResults', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/survey_results", {}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  });

  this.SurveyResultsResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
