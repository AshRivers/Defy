class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :image, :path
  #include Rails.application.routes.url_helpers
  mount_uploader :image, ImageUploader

  #one convenient method to pass jq_upload the necessary information
  
  # def to_jq_upload
  #   {
  #     "name" => read_attribute(:image),
  #     "size" => image.size,
  #     "url" => image.url,
  #     # "thumbnail_url" => image.thumb.url,
  #     "delete_url" => picture_path(:id => id),
  #     "delete_type" => "DELETE" 
  #   }
  # end
end
