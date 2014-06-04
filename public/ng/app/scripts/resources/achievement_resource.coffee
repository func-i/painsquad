@RankingResource = @resourceModule.factory 'Ranking', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/achievements", {},
    query: { method: 'GET', isArray: false }

@RankingResource.$inject = ['$http', '$resource', 'CONFIG']