'use strict'

@RankInterceptor = @serviceModule.factory 'RankInterceptor', ($q, $injector, $rootScope) ->

    success = (response, b) ->
      if response and response.data.activity and response.data.activity.show_level_up_modal
        $rootScope.$broadcast 'event:levelup', { image: response.data.activity.rank, prev_rank: response.data.activity.prev_rank, rank: response.data.activity.display_rank }
      response
    error = (response) ->
      $q.reject response
    (promise) ->
      promise.then success, error

@RankInterceptor.$inject = [ '$q', '$injector', '$rootScope' ]
