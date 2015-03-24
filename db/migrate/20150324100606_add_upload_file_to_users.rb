class AddUploadFileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :upload_file_name, :string
    add_column :users, :upload_file, :binary
  end
end
