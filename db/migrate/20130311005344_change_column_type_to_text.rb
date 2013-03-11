class ChangeColumnTypeToText < ActiveRecord::Migration
  def up
  	change_column :storypoints, :story, :text, :limit => nil
  end

  def down
  	change_column :storypoints, :story, :string, :limit => 255
  end
end
