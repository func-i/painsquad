'use strict'

@BodymapService = @serviceModule.service 'BodymapService', () ->

  init: ->
    @selections =
      head:  []
      torso: []
      arms:  []
      legs:  []

  getSelections: ->
    @selections ||= @init()

  anyElementsInRegion: (painRegion) ->
    @selections[painRegion].length

  # resets object after answer is saved
  reset: ->
    @init()

@BodymapService.$inject = []
