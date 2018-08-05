class AddDescriptionToPlot < ActiveRecord::Migration
  def change
    add_column :plots, :description, :text
  end
end
