class ChangeColumnDefaultValidatedAndDeleted < ActiveRecord::Migration
  def change
  	change_column :stories, :validated, :boolean, default: false
  	change_column :stories, :deleted, :boolean, default: false
  end
end
