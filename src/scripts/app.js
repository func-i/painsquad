angular.module('painSquad', [
  'ionic',
  'painSquad.routes',
  'painSquad.services',
  'painSquad.controllers'
])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})
