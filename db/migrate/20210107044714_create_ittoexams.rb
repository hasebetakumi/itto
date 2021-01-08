class CreateIttoexams < ActiveRecord::Migration[5.2]
  def change
    create_table :ittoexams do |t|
      t.integer :year
      t.integer :month
      t.integer :student_id
      t.integer :user_id
      t.integer :english_score
      t.integer :english_full_mark
      
      t.integer :japanese_score
      t.integer :japanese_full_mark
      
      t.integer :science_score
      t.integer :science_full_mark
      
      t.integer :social_score
      t.integer :social_full_mark
      t.timestamps
    end
  end
end
