'use strict'

# TODO:
#   - bind textarea input to ng-model
#   - need to hook into form $valid - $invalid unless text inputted
#   - make it work nice with $valid
#   - nice animation for hide/show?

@directiveModule.directive 'psOtherTextbox', ->
  restrict: 'A'
  link: (scope, elem, attr) ->
    textBox = '<label class="item item-input other-textbox">' +
              '<textarea placeholder="Please specify" rows="5"></textarea>' +
              '</label>'
    if scope.$last && scope.choice.textfield
      parentSelector = elem.parent().parent().parent()
      elem.bind 'click', ->
        textAreaExists = parentSelector.find('.other-textbox')
        if textAreaExists.length
          textAreaExists.toggle()
        else
          parentSelector.append(textBox)


# <div class="list">
# <label class="item item-input">
#   <textarea
#     required
#     placeholder="Please specify"
#     rows="5"
#     ng-model="question.choices[-1].value"></textarea>
# </label>
