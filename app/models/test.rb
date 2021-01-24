class Test < ApplicationRecord
  has_many :testresults, dependent: :delete_all
end
