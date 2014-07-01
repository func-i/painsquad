(function() {
  'use strict';
  this.PainService = this.serviceModule.service('PainService', function() {
    return {
      init: function(items) {
        this.pharmacological = [];
        this.physical = [];
        this.psychological = [];
        return this.parseSections(items);
      },
      parseSections: function(items) {
        return angular.forEach(items, (function(_this) {
          return function(item) {
            if (item.section === 'pharmacological') {
              _this.pharmacological.push(item);
            }
            if (item.section === 'physical') {
              _this.physical.push(item);
            }
            if (item.section === 'psychological') {
              return _this.psychological.push(item);
            }
          };
        })(this));
      },
      getItems: function(section) {
        if (section === 'pharmacological') {
          return this.pharmacological;
        }
        if (section === 'physical') {
          return this.physical;
        }
        if (section === 'psychological') {
          return this.psychological;
        }
      }
    };
  });

  this.PainService.$inject = [];

}).call(this);
