class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.integer :total_likes
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
