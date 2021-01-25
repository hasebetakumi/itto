class Target < ApplicationRecord
  belongs_to :user
  belongs_to :student
  
  validates :student_id, presence: true
end
