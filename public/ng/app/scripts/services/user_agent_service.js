(function() {
  'use strict';
  this.UserAgentService = this.serviceModule.service('UserAgentService', function($window) {
    return {
      browser: function() {
        return this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
      },
      version: function() {
        return this.version = this.searchVersion(navigator.userAgent) || this.searchVersion(navigator.appVersion) || "an unknown version";
      },
      os: function() {
        return this.OS = this.searchString(this.dataOS) || "an unknown OS";
      },
      searchString: function(data) {
        var dataProp, dataString, i;
        i = 0;
        while (i < data.length) {
          dataString = data[i].string;
          dataProp = data[i].prop;
          this.versionSearchString = data[i].versionSearch || data[i].identity;
          if (dataString) {
            if (dataString.indexOf(data[i].subString) !== -1) {
              return data[i].identity;
            }
          } else {
            if (dataProp) {
              return data[i].identity;
            }
          }
          i++;
        }
      },
      searchVersion: function(dataString) {
        var index;
        index = dataString.indexOf(this.versionSearchString);
        if (index === -1) {
          return;
        }
        return parseFloat(dataString.substring(index + this.versionSearchString.length + 1));
      },
      dataBrowser: [
        {
          string: navigator.userAgent,
          subString: "Chrome",
          identity: "Chrome"
        }, {
          string: navigator.userAgent,
          subString: "OmniWeb",
          versionSearch: "OmniWeb/",
          identity: "OmniWeb"
        }, {
          string: navigator.vendor,
          subString: "Apple",
          identity: "Safari",
          versionSearch: "Version"
        }, {
          prop: window.opera,
          identity: "Opera",
          versionSearch: "Version"
        }, {
          string: navigator.vendor,
          subString: "iCab",
          identity: "iCab"
        }, {
          string: navigator.vendor,
          subString: "KDE",
          identity: "Konqueror"
        }, {
          string: navigator.userAgent,
          subString: "Firefox",
          identity: "Firefox"
        }, {
          string: navigator.vendor,
          subString: "Camino",
          identity: "Camino"
        }, {
          string: navigator.userAgent,
          subString: "Netscape",
          identity: "Netscape"
        }, {
          string: navigator.userAgent,
          subString: "MSIE",
          identity: "Explorer",
          versionSearch: "MSIE"
        }, {
          string: navigator.userAgent,
          subString: "Gecko",
          identity: "Mozilla",
          versionSearch: "rv"
        }, {
          string: navigator.userAgent,
          subString: "Mozilla",
          identity: "Netscape",
          versionSearch: "Mozilla"
        }
      ],
      dataOS: [
        {
          string: navigator.platform,
          subString: "Win",
          identity: "Windows"
        }, {
          string: navigator.platform,
          subString: "Mac",
          identity: "Mac"
        }, {
          string: navigator.userAgent,
          subString: "iPhone",
          identity: "iPhone/iPod"
        }, {
          string: navigator.platform,
          subString: "Linux",
          identity: "Linux"
        }
      ]
    };
  });

  this.UserAgentService.$inject = ['$window'];

}).call(this);
