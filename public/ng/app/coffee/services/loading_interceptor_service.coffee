'use strict'

@LoadingInterceptor = @serviceModule.factory 'LoadingInterceptor', ($q, $rootScope, $injector) ->

  request: (request) ->
    # $injector.get('$ionicLoading').show
    #   content:      "Loading..."
    #   animation:    "fade-in"
    #   showBackdrop: true
    #   showDelay:    300
    request or $q.when(request)

  response: (response) ->
    # $injector.get('$ionicLoading').hide()
    response or $q.when(response)

@LoadingInterceptor.$inject = [ '$q', '$rootScope', '$injector' ]
