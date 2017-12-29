class Comment < ApplicationRecord
    belongs_to :student, optional: true
    belongs_to :question
    belongs_to :teacher, optional: true
    
    validates :content, presence: true
    
    def by
        #a method that extracts the name of the person that made the comment
        if self.student_id != nil
            @student = Student.find(self.student_id)
            @student.preferred_name
        else
            @teacher = Teacher.find(self.teacher_id)
            @teacher.preferred_name
        end
    end
    
    def at
        #a method that extracts the date and time the comment was created or updated, whichever was last
        self.created_at.strftime("%m/%d/%Y at %I:%M%p")
    end
    
end

