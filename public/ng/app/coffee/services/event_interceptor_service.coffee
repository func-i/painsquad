'use strict'

@EventInterceptor = @serviceModule.factory 'EventInterceptor', ($q, $injector, $rootScope) ->

    success = (response) ->
      if response and response.data and response.data.activity
        if response.data.activity.show_level_up_modal
          $rootScope.$broadcast 'event:levelup', { image: response.data.activity.rank, prev_rank: response.data.activity.prev_rank, rank: response.data.activity.display_rank }
        if response.data.activity.show_advice_modal
          $rootScope.$broadcast 'event:advice', { name: response.data.activity.advice_name }
      response
    error = (response) ->
      if (response.data is '' && response.status is 0)
        $injector.get("$state").transitionTo "app.notconnected"

      $q.reject response
    (promise) ->
      promise.then success, error

@EventInterceptor.$inject = [ '$q', '$injector', '$rootScope' ]
