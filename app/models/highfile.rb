class Highfile < ApplicationRecord
    belongs_to :user
  belongs_to :student
  
  validates :student_id, presence: true
  mount_uploader :image, HighfileUploader
end
