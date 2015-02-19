class AddLevelledUpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :levelled_up, :boolean
  end
end
