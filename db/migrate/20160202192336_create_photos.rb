class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :image
      t.integer :like

      t.timestamps null: false
    end
  end
end
