'use strict'

@PainService = @serviceModule.service 'PainService', () ->

  init: (items) ->
    @pharmacological = []
    @physical        = []
    @psychological   = []
    @parseSections(items)

  parseSections: (items) ->
    angular.forEach items, (item) =>
      @pharmacological.push item if item.section is 'pharmacological'
      @physical.push item if item.section is 'physical'
      @psychological.push item if item.section is 'psychological'

  getItems: (section) ->
    return @pharmacological if section is 'pharmacological'
    return @physical if section is 'physical'
    return @psychological if section is 'psychological'

@PainService.$inject = []
