class AddBooleansToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :selected, :boolean, default: :false
    add_column :choices, :disabled, :boolean, default: :false
    add_column :choices, :can_disable, :boolean, default: :false
  end
end
