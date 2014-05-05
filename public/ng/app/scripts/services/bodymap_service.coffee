'use strict'

@serviceModule.service 'BodymapService', ["_", (_) ->

  # creates new singleton object
  init: () ->
    @selections =
      head:  []
      torso: []
      arms:  []
      legs:  []

  # # retrieves singleton object
  getSelections: () ->
    @selections ||= @init()

  # # adds object to answer payload
  addSelection: (parentNode, element) ->
    @selections[parentNode].push element

  # removes object from payload
  removeSelection: (parentNode, element) ->
    @selections[parentNode].splice(@selections[parentNode].indexOf(element), 1)

  # empties subarray
  clearRegion: (parentNode) ->
    return if _.isUndefined(@selections[parentNode])
    @selections[parentNode] = [] if @selections[parentNode].length

  # checks if element already selected
  elementInSelection: (parentNode, element) ->
    _.contains(@selections[parentNode], element)

  anyElementsInRegion: (parentNode) ->
    _.any(@selections[parentNode])

]