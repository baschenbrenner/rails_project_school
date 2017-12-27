class CreateEssentialLearnings < ActiveRecord::Migration[5.1]
  def change
    create_table :essential_learnings do |t|
      t.integer :course_id
      t.string :name
      t.text :content
    end
  end
end
