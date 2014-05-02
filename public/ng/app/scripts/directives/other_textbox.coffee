'use strict'

# TODO:
#   - bind textarea input to ng-model
#   - need to hook into form $valid - $invalid unless text inputted
#   - nice animation for hide/show?
@directiveModule.directive 'psOtherTextbox', ->
  restrict: 'A'
  link: (scope, elem, attr) ->
    elem.on 'click tap touch', ->
      scope.$apply(createTextBox)

    createTextBox = ->
      textBox = '<label class="item item-input other-textbox">' +
                '<textarea placeholder="Please specify" rows="5" ></textarea>' +
                '</label>'
      parentSelector = elem.parents('ul')
      textAreaExists = parentSelector.find('.other-textbox')
      if textAreaExists.length
        textAreaExists.toggle()
      else
        parentSelector.append(textBox)
