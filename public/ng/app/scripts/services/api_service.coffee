'use strict'

@serviceModule.factory 'ApiService', ['$http', ($http) ->
  baseUrl = 'http://localhost:3000/api/v1/'

  getThings: () ->
    $http.get(baseUrl + 'things')

  getThing: (id) ->
    $http.get(baseUrl + "things/#{id}")
]

# class ApiService

#   constructor: (@$http) ->
#     @baseUrl = 'http://localhost:3000/api/v1/'

#   getThings: () ->
#     $http.get(@baseUrl + 'things')

#   getThing: (id) ->
#     $http.get(@baseUrl + "things/#{id}")


# angular.module 'painSquad.apiService', [], ($provide) ->
#   $provide.factory 'apiService', ['$http', ($http) -> new ApiService($http)]
