class Report < ApplicationRecord
    belongs_to :student
    belongs_to :user
    belongs_to :subject
end
