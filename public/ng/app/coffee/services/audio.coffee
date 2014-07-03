'use strict'

@Audio = @serviceModule.factory 'audio', ($document) ->
  audio = $document[0].createElement("audio")
  audio