class StudentType < ApplicationRecord
  has_many :students, dependent: :delete_all
end
