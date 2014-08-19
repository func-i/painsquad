(function() {
  'use strict';
  this.NetworkService = this.serviceModule.factory('NetworkService', function($ionicPlatform, $q) {
    var Connection, asyncGetConnection;
    Connection = window.Connection || {
      CELL: "cellular",
      CELL_2G: "2g",
      CELL_3G: "3g",
      CELL_4G: "4g",
      ETHERNET: "ethernet",
      WIFI: "wifi",
      NONE: "none",
      UNKNOWN: "unknown"
    };
    asyncGetConnection = function() {
      var q;
      q = $q.defer();
      $ionicPlatform.ready(function() {
        if (navigator.connection) {
          q.resolve(navigator.connection);
        } else {
          q.reject("navigator.connection is not defined");
        }
      });
      return q.promise;
    };
    return {
      isOnline: function() {
        return asyncGetConnection().then(function(networkConnection) {
          var isConnected;
          isConnected = false;
          switch (networkConnection.type) {
            case Connection.ETHERNET:
            case Connection.WIFI:
            case Connection.CELL_2G:
            case Connection.CELL_3G:
            case Connection.CELL_4G:
            case Connection.CELL:
              isConnected = true;
          }
          return isConnected;
        });
      }
    };
  });

  this.NetworkService.$inject = ['$ionicPlatform', '$q'];

}).call(this);
