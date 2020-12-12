class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :student_id
      t.string :user_id
      t.string :grade
      t.string :semester
      t.string :english
      t.string :math
      t.string :japanese
      t.string :science
      t.string :social
      t.string :art
      t.string :pe
      t.string :techhome
      t.string :music
      t.string :total
      t.timestamps
    end
  end
end
