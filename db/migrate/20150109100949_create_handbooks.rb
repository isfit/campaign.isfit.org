class CreateHandbooks < ActiveRecord::Migration
  def change
    create_table :handbooks do |t|

      t.timestamps
    end
  end
end
