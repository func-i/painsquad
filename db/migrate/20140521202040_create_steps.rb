class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :recommendation
      t.string :content
      t.string :tip
      t.string :audio_path
      t.string :video_path

      t.timestamps
    end
  end
end
