'use strict'

@AuthInterceptor = @serviceModule.factory 'AuthInterceptor', ($q, $injector, $rootScope) ->

    success = (response) ->
      response
    error = (response) ->
      if response.status is 401
        if $injector.get('$rootScope').firstLaunch
          $injector.get("$state").transitionTo "app.intro"
          $injector.get('$rootScope').firstLaunch = false
        else
          $injector.get("$state").transitionTo "app.login"
        $q.reject response
      else
        $q.reject response
    (promise) ->
      promise.then success, error

@AuthInterceptor.$inject = [ '$q', '$injector' ]
