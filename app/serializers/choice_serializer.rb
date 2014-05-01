class ChoiceSerializer < ActiveModel::Serializer
  attributes :id, :content, :value, :textfield, :custom_text
end