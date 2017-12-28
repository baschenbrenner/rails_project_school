class EssentialLearning < ApplicationRecord
    belongs_to :course
    
    validates :name, presence: true
    validates :content, presence: true
end
