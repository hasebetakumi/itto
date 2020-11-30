class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.integer :classifying
      t.string :school
      t.timestamps
    end
  end
end
