'use strict'

@AuthInterceptor = @serviceModule.factory 'AuthInterceptor', ($q, $injector, $location) ->

    success = (response) ->
      console.log 'success response: ', response
      response
    error = (response) ->
      console.log 'error response: ', response
      if response.status is 401
        $injector.get("$state").transitionTo "app.login"
        # if !localStorage.getItem('introComplete')
        #   $injector.get("$state").transitionTo "app.intro"
        # else
        #   $injector.get("$state").transitionTo "app.login"
        $q.reject response
      else
        $q.reject response
    (promise) ->
      promise.then success, error

@AuthInterceptor.$inject = [ '$q', '$injector' ]
