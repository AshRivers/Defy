class RemovePlotIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :plot_id
  end

  def down
    add_column :users, :plot_id, :integer
  end
end
