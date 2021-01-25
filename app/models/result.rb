class Result < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :semester
  
  validates :student_id, presence: true
  validates :grade, presence: true
  validates :semester_id, presence: true


end
