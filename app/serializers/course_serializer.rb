class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :teacher_id, :catalog_number, :room_number, :day_time_meeting

end
