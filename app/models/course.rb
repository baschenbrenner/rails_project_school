class Course < ApplicationRecord
    belongs_to :teacher
    has_many :enrollments
    has_many :students, through: :enrollments
    has_many :essential_learnings
    has_many :questions
    has_many :comments, through: :questions
    
    
    def teacher_name
        self.teacher.preferred_name
    end
end
