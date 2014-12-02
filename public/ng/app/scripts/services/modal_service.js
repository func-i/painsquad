(function() {
  'use strict';
  this.ModalService = this.serviceModule.factory('ModalService', function($ionicModal) {
    return {
      registerModals: function(scope) {
        scope.modals = {};
        this.loadModal(scope, 'login', 'templates/shared/modal.login.html', {
          scope: scope,
          animation: 'fade-in',
          focusFirstInput: true
        });
        this.loadModal(scope, 'levelupModal', 'templates/shared/levelup.html', {
          scope: scope,
          animation: 'slide-left-right'
        });
        return this.loadModal(scope, 'genericModal', 'templates/shared/modal.generic.html', {
          scope: scope,
          animation: 'slide-left-right'
        });
      },
      loadModal: function(scope, modalName, templateUrl, options) {
        return $ionicModal.fromTemplateUrl(templateUrl, options).then(function(modal) {
          return scope.modals[modalName] = modal;
        });
      }
    };
  });

  this.ModalService.$inject = [];

}).call(this);
