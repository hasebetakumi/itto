class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :classifying
      t.integer :grade
      t.integer :school_id
      t.integer :year
      t.string :family_name
      t.string :given_name
      t.string :family_name_kana
      t.string :given_name_kana
      t.integer :student_type_id
      t.timestamps
    end
  end
end
