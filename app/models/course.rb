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
    
    def meeting_schedule_string
        days = self.day_time_meeting.slice(0,2)
        if days == "MW"
            string = "Monday and Wednesday at #{day_time_meeting.slice(4,18)}"
        elsif days == "TR"
            string = "Tuesday and Thursday at #{day_time_meeting.slice(4,18)}"
        elsif days == "TB"
            string = "To Be Determined"
        else
            string = "Error in Reading meeting times"
        end
    end
    
        
end

