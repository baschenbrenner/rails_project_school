class EssentialLearningSerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  belongs_to :course
end
