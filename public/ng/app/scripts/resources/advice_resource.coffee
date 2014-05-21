@AdviceResource = @resourceModule.factory 'Advice', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/advices", {},
    query:
      method: 'GET'
      isArray: false

@AdviceResource.$inject = ['$http', '$resource', 'CONFIG']