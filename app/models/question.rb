class Question < ApplicationRecord
    belongs_to :student
    belongs_to :course
    has_many :comments
    
    def asked_by
        self.student.preferred_name
    end
    
    def asked_when
        date_time = self.created_at
        date_time.strftime("Asked %m/%d/%Y at %I:%M%p")
    end
end
