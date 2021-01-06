class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.integer :student_id
      t.integer :user_id
      t.integer :exam_coverage_first
      t.integer :exam_coverage_last
      t.integer :score
      t.integer :full_mark
      t.timestamps
    end
  end
end
