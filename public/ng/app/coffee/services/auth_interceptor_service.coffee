'use strict'

@AuthInterceptor = @serviceModule.factory 'AuthInterceptor', ($q, $injector) ->

    success = (response) ->
      response
    error = (response) ->
      if response.status is 401 or response.status is 404
        $injector.get("$state").transitionTo "app.login"
        $q.reject response
      else
        $q.reject response
    (promise) ->
      promise.then success, error

@AuthInterceptor.$inject = [ '$q', '$injector' ]
