class CreateStudentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :student_types do |t|
      t.string :student_type
      t.text :student_character
      t.text :student_howto
      t.timestamps
    end
  end
end
