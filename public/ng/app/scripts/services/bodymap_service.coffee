'use strict'

@serviceModule.service 'BodymapService', ["_", (_) ->

  # creates new singleton object
  init: () ->
    @selections =
      head:  []
      torso: []
      arms:  []
      legs:  []

  # retrieves singleton object
  getSelections: () ->
    @selections

  # adds object to answer payload
  addSelection: (body_region, pain_area) ->
    @selections[body_region].push pain_area

  # removes object from payload
  removeSelection: (body_region, pain_area) ->
    @selections[body_region].splice(@selections[body_region].indexOf(element]), 1)

  # checks if element already selected
  elementInSelection = (parentNode, element) ->
    _.contains(@selections[parentNode], element)

]