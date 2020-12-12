class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :student_id
      t.integer :user_id
      t.integer :grade
      t.integer :semester
      t.integer :english
      t.integer :math
      t.integer :japanese
      t.integer :science
      t.integer :social
      t.integer :art
      t.integer :pe
      t.integer :techhome
      t.integer :music
      t.integer :total
      t.timestamps
    end
  end
end
