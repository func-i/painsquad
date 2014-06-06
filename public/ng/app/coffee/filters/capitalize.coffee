'use strict'

@filterModule.filter 'capitalize', ->
  (input) ->
    if input?
      input = input.toLowerCase()
      input.substring(0, 1).toUpperCase() + input.substring(1)