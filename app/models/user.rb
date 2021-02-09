class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :reports, dependent: :delete_all
  has_many :results, dependent: :delete_all
  has_many :testresults, dependent: :delete_all
  has_many :targets, dependent: :delete_all
  has_many :ittoexams, dependent: :delete_all
  has_many :highfiles, dependent: :delete_all

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
end
