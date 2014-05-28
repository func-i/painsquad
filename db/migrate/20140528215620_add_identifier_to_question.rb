class AddIdentifierToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :identifier, :string
  end
end
