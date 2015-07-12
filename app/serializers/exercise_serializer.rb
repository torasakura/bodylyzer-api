class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :video_url, :unit
end
