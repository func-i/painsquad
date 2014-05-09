class ChoiceSerializer < ActiveModel::Serializer
  attributes :id, :content, :value, :textfield, :selected, :disabled, :can_disable
end