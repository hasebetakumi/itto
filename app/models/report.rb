class Report < ApplicationRecord
  belongs_to :student
  belongs_to :user
  belongs_to :subject
  belongs_to :classifying
  
  validates :student_id, presence: true
end
