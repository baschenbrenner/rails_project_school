class Teacher < ApplicationRecord
    has_secure_password
    
    has_many :students
    has_many :courses
    has_many :students, through: :courses
    has_many :comments
    has_many :questions, through: :students
    
end
