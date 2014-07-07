(function() {
  'use strict';
  this.NotificationService = this.serviceModule.factory('NotificationService', function($q) {
    return {
      add: function(options, scope) {
        var q;
        q = $q.defer();
        window.plugin.notification.local.add(options, (function(result) {
          return q.resolve(result);
        }), scope);
        return q.promise;
      },
      cancel: function(id, scope) {
        var q;
        q = $q.defer();
        window.plugin.notification.local.cancel(id, (function(result) {
          return q.resolve(result);
        }), scope);
        return q.promise;
      },
      cancelAll: function(scope) {
        var q;
        q = $q.defer();
        window.plugin.notification.local.cancelAll((function(result) {
          return q.resolve(result);
        }), scope);
        return q.promise;
      },
      isScheduled: function(id, scope) {
        var q;
        q = $q.defer();
        window.plugin.notification.local.isScheduled(id, (function(result) {
          return q.resolve(result);
        }), scope);
        return q.promise;
      },
      getScheduledIds: function(scope) {
        var q;
        q = $q.defer();
        window.plugin.notification.local.getScheduledIds((function(result) {
          return q.resolve(result);
        }), scope);
        return q.promise;
      },
      isTriggered: function(id, scope) {
        var q;
        q = $q.defer();
        window.plugin.notification.local.isTriggered(id, (function(result) {
          return q.resolve(result);
        }), scope);
        return q.promise;
      },
      getTriggeredIds: function(scope) {
        var q;
        q = $q.defer();
        window.plugin.notification.local.getTriggeredIds((function(result) {
          return q.resolve(result);
        }), scope);
        return q.promise;
      },
      getDefaults: function() {
        return window.plugin.notification.local.getDefaults();
      },
      setDefaults: function(Object) {
        return window.plugin.notification.local.setDefaults(Object);
      },
      onadd: function() {
        return window.plugin.notification.local.onadd;
      },
      ontrigger: function() {
        return window.plugin.notification.local.ontrigger;
      },
      onclick: function() {
        return window.plugin.notification.local.onclick;
      },
      oncancel: function() {
        return window.plugin.notification.local.oncancel;
      }
    };
  });

  this.NotificationService.$inject = ['$q'];

}).call(this);
