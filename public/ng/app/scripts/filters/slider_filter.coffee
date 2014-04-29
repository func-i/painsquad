'use strict'

@filterModule.filter 'sliderFilter', ->
  (input) ->
    if input then Math.floor(input / 10) else 0