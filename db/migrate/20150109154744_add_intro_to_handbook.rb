class AddIntroToHandbook < ActiveRecord::Migration
  def change
    add_column :handbooks, :intro, :string
    add_column :handbooks, :conclusion, :string
  end
end
