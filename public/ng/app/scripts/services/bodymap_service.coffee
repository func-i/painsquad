'use strict'

@serviceModule.service 'BodymapService', ["_", (_) ->

  # new singleton object
  init: () ->
    @selections =
      head:  []
      torso: []
      arms:  []
      legs:  []

  # retrieves singleton object
  getSelections: () ->
    @selections ||= @init()

  # body region 'checked' state
  anyElementsInRegion: (parentNode) ->
    _.any(@selections[parentNode])

]
