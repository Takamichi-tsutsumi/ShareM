class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.binary :upload_file
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :songs, [:user_id, :created_at]
  end
end
