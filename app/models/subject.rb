class Subject < ApplicationRecord
  has_many :reports, dependent: :delete_all
end
