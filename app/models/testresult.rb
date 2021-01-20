class Testresult < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :test
end
