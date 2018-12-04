class CreateTableNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
    	t.timestamps
    	t.references :student, foreign_key: true, index: true
    	t.references :course, foreign_key: true, index: true
    	t.string :point
    	t.references :matter
    end
  end
end
