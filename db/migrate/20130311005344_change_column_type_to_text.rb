class ChangeColumnTypeToText < ActiveRecord::Migration
  def up
  	change_column :storypoints, :story, :text
  end

  def down
  	change_column :storypoints, :story, :string
  end
end
