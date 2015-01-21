class AddNameToHandbook < ActiveRecord::Migration
  def change
    add_column :handbooks, :name, :string
  end
end
