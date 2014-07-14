'use strict'

@AudioPlayer = @serviceModule.factory 'AudioPlayer', ($document, audio) ->
    player    = undefined
    audioFile = undefined

    player =
      playing:     false
      audioFile:   undefined
      currentTime: 0
      duration:    0
      progress:    0

      play: ->
        audio.play()
        player.currentTime = audio.currentTime
        player.duration    = audio.duration
        player.progress    = player.currentTime / player.duration

      pause: ->
        audio.pause()

      stop: ->
        audio.pause()
        audio.currentTime = 0

      # duration: ->
      #   if audio.duration is NaN
      #     0
      #   else
      #     audio.duration

      # currentTime: ->
      #   audio.currentTime

      # progress: ->
      #   @currentTime / @duration

      initAudio: (path) ->
        audioFile = "./images/advice/audio/#{path}.mp3"
        audio.src = audioFile

    player

@AudioPlayer.$inject = [ '$document', 'audio' ]
