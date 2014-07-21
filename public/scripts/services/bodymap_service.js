(function() {
  'use strict';
  this.BodymapService = this.serviceModule.service('BodymapService', function() {
    return {
      init: function() {
        return this.selections = {
          head: [],
          torso: [],
          arms: [],
          legs: []
        };
      },
      getSelections: function() {
        return this.selections || (this.selections = this.init());
      },
      anyElementsInRegion: function(painRegion) {
        return this.selections[painRegion].length;
      },
      reset: function() {
        return this.init();
      }
    };
  });

  this.BodymapService.$inject = [];

}).call(this);
