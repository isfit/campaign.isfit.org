class ChangeIntroTypeInHandbooks < ActiveRecord::Migration
  def change
  	change_column :handbooks, :intro, :text
  	change_column :handbooks, :conclusion, :text
  end
end
