'use strict'

@AudioPlayer = @serviceModule.factory 'AudioPlayer', ($document, audio) ->
    player    = undefined
    audioFile = undefined

    player =
      playing:   false
      audioFile: undefined

      play: ->
        audio.play()

      pause: ->
        audio.pause()

      initAudio: (path) ->
        audioFile = "./images/advice/audio/#{path}.mp3"
        audio.src = audioFile

    player

@AudioPlayer.$inject = [ '$document', 'audio' ]
