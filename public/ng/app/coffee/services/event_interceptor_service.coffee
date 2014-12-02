'use strict'

@EventInterceptor = @serviceModule.factory 'EventInterceptor', ($q, $injector, $rootScope) ->

    success = (response) ->
      if response and response.data and response.data.activity and response.data.activity.modals

        for modal in response.data.activity.modals
          $rootScope.$broadcast "event:#{modal.event_name}", modal.options

      response
    error = (response) ->
      if (response.data is '' && response.status is 0)
        $injector.get("$state").transitionTo "app.notconnected"

      $q.reject response
    (promise) ->
      promise.then success, error

@EventInterceptor.$inject = [ '$q', '$injector', '$rootScope' ]
