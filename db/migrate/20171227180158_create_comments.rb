class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.integer :question_id
      t.text :content
      t.datetime :created_at, null:false
      t.datetime :updated_at, null:false
    end
  end
end
