class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :story
      t.references :continent, index: true
      t.references :country, index: true
      t.string :mail
      t.integer :rating

      t.timestamps
    end
  end
end
