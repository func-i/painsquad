class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :submission_id, :choice_id, :question_id, :value, :custom_text, :data_object
end