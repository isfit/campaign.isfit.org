class AddImageFileNameToHandbooks < ActiveRecord::Migration
  def change
    add_column :handbooks, :image_file_name, :string
  end
end
