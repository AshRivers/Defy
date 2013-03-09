class AddPlotIdToStorypoints < ActiveRecord::Migration
  def change
    add_column :storypoints, :plot_id, :integer
  end
end
