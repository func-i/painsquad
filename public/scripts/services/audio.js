(function() {
  'use strict';
  this.Audio = this.serviceModule.factory('audio', function($document) {
    var audio;
    audio = $document[0].createElement("audio");
    return audio;
  });

}).call(this);
