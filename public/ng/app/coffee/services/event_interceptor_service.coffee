'use strict'

@EventInterceptor = @serviceModule.factory 'EventInterceptor', ($q, $injector, $rootScope, $timeout) ->

    success = (response) ->
      if response and response.data and response.data.activity and response.data.activity.modals

        for modal, i in response.data.activity.modals
          ((m, index) ->
            $timeout ->
              $rootScope.$broadcast "event:#{m.event_name}", m.options
            , index * 3700
          )(modal, i)

      response
    error = (response) ->
      if (response.data is '' && response.status is 0)
        $injector.get("$state").transitionTo "app.notconnected"

      $q.reject response
    (promise) ->
      promise.then success, error

@EventInterceptor.$inject = [ '$q', '$injector', '$rootScope' ]
