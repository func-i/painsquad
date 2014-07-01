class StepSerializer < ActiveModel::Serializer
  attributes :id, :content, :tip, :audio_path, :video_path, :image_path
end