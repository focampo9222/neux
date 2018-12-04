class CreateTableCourseMatters < ActiveRecord::Migration[5.2]
  def change
    create_table :course_matters do |t|
    	t.timestamps
    	t.references :matter, foreign_key: true, index: true
    	t.references :course, foreign_key: true, index: true
    end
    add_index :course_matters, [:matter_id, :course_id], unique: true
  end
end
