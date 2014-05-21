'use strict'

# @AdviceCtrl = @controllerModule.controller 'AdviceCtrl', ($scope, $state, advice) ->
@AdviceCtrl = @controllerModule.controller 'AdviceCtrl', ($scope, $state) ->

  console.log "Advice Ctrl Instantiated"

  # TODO: this data should ideally come to the server based on the users state
  # we should dynamically populate the 'recommended' list based on this data
  # as well as the sub-views
  # $scope.data = {}
  # $scope.data.recommended = [
  #   {
  #     title:    "Behaviour Rehersal",
  #     image:    "http://placeotter.com/80/80",
  #     duration: "5 min. to 10 min.",
  #     resolves: "Before Procedures",
  #     favorite: true
  #   },
  #   {
  #     title:    "Mental Games",
  #     image:    "http://placeotter.com/80/80",
  #     duration: "5 min. to 10 min.",
  #     resolves: "During Procedures, Headaches, Abdomen Pain, Muscle Pain",
  #     favorite: false
  #   },
  #   {
  #     title:    "Gentle Exercise",
  #     image:    "http://placeotter.com/80/80",
  #     duration: "10 min. to 40 min.",
  #     resolves: "Muscle Pain, Headache, Abdominal Pain, Surgeries",
  #     favorite: false
  #   }
  # ]


@AdviceCtrl.$inject = ['$scope', '$state']
# @AdviceCtrl.$inject = ['$scope', '$state', 'advice']


# resolve this resource before loading the controller
# @SurveyCtrl.resolve =
#   advice: {}
  # advice: (Advice, $q) ->
#     deferred = $q.defer()

#     Advice.query (response) ->
#       deffered.resolve response
#       # deferred.resolve response.survey

#     deferred.promise
