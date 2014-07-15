(function() {
  'use strict';
  this.AudioPlayer = this.serviceModule.factory('AudioPlayer', function($document, audio) {
    var audioFile, player;
    player = void 0;
    audioFile = void 0;
    player = {
      playing: false,
      audioFile: void 0,
      play: function() {
        return audio.play();
      },
      pause: function() {
        return audio.pause();
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
