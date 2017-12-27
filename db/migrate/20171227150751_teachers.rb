class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :preferred_name
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :quote
      t.string :bio
      t.string :uid
    end
  end
end
