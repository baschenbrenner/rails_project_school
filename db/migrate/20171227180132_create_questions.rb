class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :student_id
      t.integer :course_id
      t.text :content
      t.datetime :created_at, null:false
    end
  end
end
