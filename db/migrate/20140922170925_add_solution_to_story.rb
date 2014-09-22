class AddSolutionToStory < ActiveRecord::Migration
  def change
    add_column :stories, :solution, :text
  end
end
