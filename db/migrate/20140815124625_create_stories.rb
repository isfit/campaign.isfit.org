class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :author
      t.text :story
      t.references :continent, index: true
      t.references :author_nationality, index: true
      t.references :happened_in, index: true
      t.string :email
      t.integer :rating

      t.timestamps
    end
  end
end
