class CreateTableCourseStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :course_students do |t|
    	t.timestamps
    	t.references :student, foreign_key: true, index: true
    	t.references :course, foreign_key: true, index: true
    end
  end
end
