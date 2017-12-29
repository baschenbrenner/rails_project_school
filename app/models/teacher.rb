class Teacher < ApplicationRecord
    has_secure_password
    
    has_many :courses
    has_many :students, through: :courses
    has_many :comments
    has_many :questions, through: :students
    
    validates :email, uniqueness: true
    
    
    def self.student_count
        @teachers = Teacher.all
        @teachers.map {|t| t.students.count}
    end
    
end
