'use strict'

# TODO:
#   - bind textarea input to ng-model
#   - need to hook into form $valid - $invalid unless text inputted
#   - nice animation for hide/show?
@directiveModule.directive 'psOtherTextbox', ->
  restrict: 'A'
  require: 'ngModel'
  link: (scope, elem, attr) ->
    textBox = '<label class="item item-input other-textbox">' +
          '<textarea placeholder="Please specify" rows="5"></textarea>' +
          '</label>'
    if scope.choice.textfield
      elem.parents('ul').append(textBox)
      scope.$watch attr.psOtherTextbox, (value) ->
        ctrl.$setViewValue(value)
        ctrl.$render()

    # return unless ngModel
    # elem.on 'click tap touch', ->
    #   scope.$apply(createTextBox)

    # createTextBox = ->
    #   textBox = '<label class="item item-input other-textbox">' +
    #             '<textarea ng-model="choice.value" ng-min="5" placeholder="Please specify" rows="5"></textarea>' +
    #             '</label>'
    #   parentSelector = elem.parents('ul')
    #   textAreaExists = parentSelector.find('.other-textbox')
    #   if textAreaExists.length
    #     textAreaExists.toggle()
    #   else
    #     parentSelector.append(textBox)

# <div class="list">
# <label class="item item-input">
#   <textarea
#     required
#     placeholder="Please specify"
#     rows="5"
#     ng-model="question.choices[-1].value"></textarea>
# </label>
