class Student < ApplicationRecord
    has_secure_password
    
    has_many :teachers
    has_many :enrollments
    has_many :courses, through: :enrollments
    has_many :teachers, through: :courses
    has_many :questions
    has_many :comments
    
    validates :email, uniqueness: true
    
    def course_ids=(array)
       if array == [""]
       else
           self.save
           array.shift
           array.each do |course_id|
               self.enrollments.build(course_id: course_id).save
           end
       end
    end
    
    def full_name
        "#{self.last_name}, #{self.first_name}"
    end
end
