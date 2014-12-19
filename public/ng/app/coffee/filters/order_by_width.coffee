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
        array.push(item)

    compare = (a,b) ->
      if (a.content < b.content)
         return -1
      if (a.content > b.content)
        return 1
      return 0

    array[array.length - 1].wide = true if array.length % 2 != 0
    return array.sort(compare).concat(pushToEnd.sort(compare)).concat(lastItem)
