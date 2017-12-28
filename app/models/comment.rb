class Comment < ApplicationRecord
    belongs_to :student, optional: true
    belongs_to :question
    belongs_to :teacher, optional: true
    
    validates :content, presence: true
end
