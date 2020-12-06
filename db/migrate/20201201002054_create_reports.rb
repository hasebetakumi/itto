class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :classifying_id
      t.integer :student_id
      t.integer :user_id
      t.integer :subject_id
      t.integer :class_textbook
      t.integer :class_start_page
      t.integer :class_end_page
      t.text :report
      t.integer :home_textbook
      t.integer :home_start_page
      t.integer :home_end_page
      t.integer :understanding
      t.timestamps
    end
  end
end
