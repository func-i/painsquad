'use strict'

@BodymapService = @serviceModule.service 'BodymapService', (_) ->

  init: ->
    @selections =
      head:  []
      torso: []
      arms:  []
      legs:  []

  getSelections: ->
    @selections ||= @init()

  anyElementsInRegion: (painRegion) ->
    _.any(@selections[painRegion])

  # resets object after answer is saved
  reset: ->
    @init()

@BodymapService.$inject = ['_']
