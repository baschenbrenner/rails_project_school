class CreateTableCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :teacher_id
      t.string :catalog_number
      t.string :room_number
      t.string :day_time_meeting
    end
  end
end
