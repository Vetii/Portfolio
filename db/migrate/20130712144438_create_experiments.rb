class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :title
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
