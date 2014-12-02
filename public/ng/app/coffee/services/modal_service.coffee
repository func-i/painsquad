'use strict'

@ModalService = @serviceModule.factory 'ModalService', ($ionicModal) ->

  registerModals: (scope) ->
    scope.modals = {}

    @loadModal(scope, 'login', 'templates/shared/modal.login.html',
      scope: scope
      animation: 'fade-in',
      focusFirstInput: true
    )

    @loadModal(scope, 'levelupModal', 'templates/shared/levelup.html',
      scope: scope
      animation: 'slide-left-right'
    )

    @loadModal(scope, 'advice', 'templates/shared/advice.html',
      scope: scope
      animation: 'slide-left-right'
    )

    @loadModal(scope, 'medalModal', 'templates/shared/medal.html',
      scope: scope
      animation: 'slide-left-right'
    )

  loadModal: (scope, modalName, templateUrl, options) ->
    $ionicModal.fromTemplateUrl(templateUrl, options).then (modal) ->
      scope.modals[modalName] = modal

@ModalService.$inject = [ ]
