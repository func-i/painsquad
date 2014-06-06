class AddAwardLevelsToUser < ActiveRecord::Migration
  def change
    add_column :users, :award_level, :integer, default: 0
    add_column :users, :cross_level, :integer, default: 0
    add_column :users, :star_level, :integer, default: 0
    add_column :users, :commendation, :boolean, default: false
    add_column :users, :medal, :boolean, default: false
  end
end
