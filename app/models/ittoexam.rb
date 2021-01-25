class Ittoexam < ApplicationRecord
  belongs_to :user
  belongs_to :student
  
  validates :year, presence: true
  validates :month, presence: true
end
