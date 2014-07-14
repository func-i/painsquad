(function() {
  'use strict';
  this.AudioPlayer = this.serviceModule.factory('AudioPlayer', function($document, audio) {
    var audioFile, player;
    player = void 0;
    audioFile = void 0;
    player = {
      playing: false,
      audioFile: void 0,
      currentTime: 0,
      duration: 0,
      progress: 0,
      play: function() {
        audio.play();
        player.currentTime = audio.currentTime;
        player.duration = audio.duration;
        return player.progress = player.currentTime / player.duration;
      },
      pause: function() {
        return audio.pause();
      },
      stop: function() {
        audio.pause();
        return audio.currentTime = 0;
      },
      initAudio: function(path) {
        audioFile = "./images/advice/audio/" + path + ".mp3";
        return audio.src = audioFile;
      }
    };
    return player;
  });

  this.AudioPlayer.$inject = ['$document', 'audio'];

}).call(this);
