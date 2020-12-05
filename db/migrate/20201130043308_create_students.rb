class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :classifying
      t.integer :grade
      t.integer :school_id
      t.string :student
      t.integer :student_type_id
      t.timestamps
    end
  end
end
