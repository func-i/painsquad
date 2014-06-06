@AchievementResource = @resourceModule.factory 'Achievement', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/achievements", {},
    query: { method: 'GET', isArray: false }

@AchievementResource.$inject = ['$http', '$resource', 'CONFIG']