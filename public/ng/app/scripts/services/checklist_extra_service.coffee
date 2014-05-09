'use strict'

@ChecklistExtraService = @serviceModule.factory 'ChecklistExtraService', (_, $scope) ->

  init: (choices) ->
    @choices ||= choices

  reset: ->
    @choices = []

  findById: (_id) ->
    _.find @choices, (choice) -> choice.id is parseInt(_id)

  # handle Other
  saveDetailInformation: (choiceId, detailData) ->
    choiceItem = @findById(choiceId)
    if choiceItem.texfield
      debugger
    else
      choiceItem.value = detailData.currentValue


@ChecklistExtraService.$inject = ['_', '$scope']
