class CreateClassifyings < ActiveRecord::Migration[5.2]
  def change
    create_table :classifyings do |t|
      t.string :classifying
      t.timestamps
    end
  end
end
