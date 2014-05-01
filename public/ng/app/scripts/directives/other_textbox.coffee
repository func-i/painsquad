'use strict'

@directiveModule.directive 'psOtherTextbox', ->
  restrict: 'A'
  link: (scope, elem, attr) ->
    textBox = '<label class="item item-input other-textbox">' +
              '<textarea placeholder="Please specify"></textarea>' +
              '</label>'
    if scope.$last && scope.choice.textfield
      parentSelector = elem.parent().parent()
      elem.bind 'click', ->
        # textAreaExists = $(this).parent().parent().find('.other-textbox')
        textAreaExists = parentSelector.find('.other-textbox')
        if textAreaExists.length
          textAreaExists.remove()
          # parentSelector.remove('.other-textbox')
          # debugger
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
