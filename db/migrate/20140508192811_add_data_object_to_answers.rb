class AddDataObjectToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :data_object, :text
  end
end
