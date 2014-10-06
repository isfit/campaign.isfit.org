class AddDisplayNameToContinents < ActiveRecord::Migration
  def change
    add_column :continents, :display_name, :string
  end
end
