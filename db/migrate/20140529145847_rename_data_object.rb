class RenameDataObject < ActiveRecord::Migration
  def change
    rename_column :answers, :data_object, :bodymap_data
  end
end
