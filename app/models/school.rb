class School < ApplicationRecord
  has_many :students, dependent: :delete_all
end
