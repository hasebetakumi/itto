class Result < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :semester
end
