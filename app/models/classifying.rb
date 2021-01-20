class Classifying < ApplicationRecord
  has_many :reports, dependent: :delete_all
end
