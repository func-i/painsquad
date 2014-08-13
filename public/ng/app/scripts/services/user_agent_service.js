(function() {
  'use strict';
  this.UserAgentService = this.serviceModule.service('UserAgentService', function($window) {
    return function() {
      var browsers, key, userAgent;
      userAgent = $window.navigator.userAgent;
      browsers = {
        chrome: /chrome/i,
        safari: /safari/i,
        firefox: /firefox/i,
        ie: /internet explorer/i
      };
      for (key in browsers) {
        if (browsers[key].test(userAgent)) {
          return key;
        }
      }
      return "unknown";
    };
  });

  this.UserAgentService.$inject = ['$window'];

}).call(this);
