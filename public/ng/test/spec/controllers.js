'use strict';

describe('Controller: MainCtrl', function () {

  var should = chai.should();

  // load the controller's module
  beforeEach(module('painSquad'));

  var MainCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    MainCtrl = $controller('MainCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of pets to the scope', function () {
    scope.pets.should.have.length(4);
  });

});
