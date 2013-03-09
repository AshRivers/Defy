class AddPosterToPlots < ActiveRecord::Migration
  def change
    add_column :plots, :poster, :string
  end
end
