class Testresult < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :test
  
  validates :student_id, presence: true
  validates :grade, presence: true
  validates :test_id, presence: true
end
