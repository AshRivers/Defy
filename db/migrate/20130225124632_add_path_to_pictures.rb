class AddPathToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :path, :string
  end
end
