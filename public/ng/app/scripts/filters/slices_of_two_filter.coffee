'use strict'

# https://groups.google.com/forum/#!topic/angular/LjwlVYMulN8
# By Rafael Dipold: http://jsbin.com/isagac/1/edit
@filterModule.filter "inSlicesOf", ["$rootScope", ($rootScope) ->
  makeSlices = (items, count) ->
    count = 3  unless count
    return items  if not angular.isArray(items) and not angular.isString(items)
    array = []
    i = 0

    while i < items.length
      chunkIndex = parseInt(i / count, 10)
      isFirst = (i % count is 0)
      array[chunkIndex] = []  if isFirst
      array[chunkIndex].push items[i]
      i++
    if angular.equals($rootScope.arrayinSliceOf, array)
      return $rootScope.arrayinSliceOf
    else
      $rootScope.arrayinSliceOf = array
    array

  return makeSlices
]