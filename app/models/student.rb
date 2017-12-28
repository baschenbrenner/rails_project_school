class Student < ApplicationRecord
    has_secure_password
    
    has_many :teachers
    has_many :enrollments
    has_many :courses, through: :enrollments
    has_many :teachers, through: :courses
    has_many :questions
    has_many :comments
    
    def full_name
        "#{self.last_name}, #{self.first_name}"
    end
end
