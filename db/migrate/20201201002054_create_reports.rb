class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :classifying
      t.integer :student_id
      t.integer :user_id
      t.string :subject
      t.text :report
      t.integer :understanding
      t.timestamps
    end
  end
end
