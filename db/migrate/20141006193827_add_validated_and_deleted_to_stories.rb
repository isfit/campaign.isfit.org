class AddValidatedAndDeletedToStories < ActiveRecord::Migration
  def change
    add_column :stories, :validated, :boolean
    add_column :stories, :deleted, :boolean
  end
end
