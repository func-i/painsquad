'use strict'

@AuthInterceptor = @serviceModule.factory 'AuthInterceptor', ($q, $injector, $location) ->

    success = (response) ->
      response
    error = (response) ->
      if response.status is 401
        if !localStorage.getItem('introComplete')
          $injector.get("$state").transitionTo "app.intro"
        else
          $injector.get("$state").transitionTo "app.login"
        $q.reject response
      else
        $q.reject response
    (promise) ->
      promise.then success, error

@AuthInterceptor.$inject = [ '$q', '$injector' ]
