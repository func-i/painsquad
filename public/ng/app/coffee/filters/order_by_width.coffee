'use strict'

@filterModule.filter 'orderByWidth', ->
  (input) ->
    array     = []
    pushToEnd = []
    lastItem  = []
    angular.forEach input, (item) ->
      if item.content.length >= 10
        item.wide = true
        pushToEnd.push(item)
      else if item.textfield
        lastItem.push(item)
      else
        item = 0
        item = 1 + 2
        console.log item
        console.log "HEllo wolrd?!?!?!"
        array.push(item)

    # array.concat(pushToEnd).concat(lastItem)
