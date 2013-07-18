class AddSourceCodeToExperiments < ActiveRecord::Migration
  def change
    add_column :experiments, :source_code, :string
  end
end
