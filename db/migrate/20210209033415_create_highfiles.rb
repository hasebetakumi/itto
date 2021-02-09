class CreateHighfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :highfiles do |t|
      t.integer :student_id
      t.string :image_name
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end
