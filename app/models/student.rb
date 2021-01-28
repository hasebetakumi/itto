class Student < ApplicationRecord
  belongs_to :school
  belongs_to :student_type
  has_many :reports, dependent: :delete_all
  has_many :results, dependent: :delete_all
  has_many :testresults, dependent: :delete_all
  has_many :targets, dependent: :delete_all
  has_many :ittoexams, dependent: :delete_all
  
  validates :school_id, presence: true
  validates :student_type_id, presence: true
  validates :grade, presence: true
  validates :classifying, presence: true
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true

  
  def name
    "#{family_name} #{given_name}"
  end

  def name_kana
    "#{family_name_kana}　#{given_name_kana}"
  end

  def student_info
    # case classifying
    # when  1
    #   classifying_detail = '小'
    # when 2
    #   classifying_detail = '中'
    # when 3
    #   classifying_detail = '高'
    # else
    #   classifying_detail = '非'
    # end
    
    classifying_detail = if classifying == 1
                           '小'
                         elsif classifying == 2
                           '中'
                         elsif classifying == 3
                           '高'
                         else
                           '非'
                         end

    "#{classifying_detail}　#{grade}年　#{family_name} #{given_name}"
  end
end
