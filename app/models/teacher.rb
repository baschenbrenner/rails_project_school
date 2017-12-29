class Teacher < ApplicationRecord
    has_secure_password
    
    has_many :courses
    has_many :students, through: :courses
    has_many :comments
    has_many :questions, through: :students
    
    validates :email, uniqueness: true
    
    
    def self.student_count
        @teachers = Teacher.order('preferred_name')
        @teachers.map {|t| t.students.count}
    end
    
    def self.with_most_students
        Course.with_most_students.teacher
    end
    
end
