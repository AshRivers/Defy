# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick

  include Cloudinary::CarrierWave
  # include CarrierWave::MiniMagick
  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end


  
  # def blur
  # manipulate! do |img|
  # img.blur('0x2')
  # img = yield(img) if block_given?
  # img
  # end
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  version :large do
    resize_to_limit(600, 600)
  end

  version :extra_large do
    resize_to_limit(800, 800)
  end

  version :container_size do
    resize_to_limit(1000,1000)
      # process :blur
    # process :convert => ['-blur 0x8']
  end

  # version :to_play, from_version: :extra_large do
  #   process crop: '800'
  #   resize_to_fit(500,500)
  # end

  version :stp_thumb, from_version: :extra_large do
    # process :crop#: '800'
    process :resize_to_fill => [200,200]
  end

  version :thumb do
    # process :crop#: '600'
    process :resize_to_fill => [100, 100]
  end

  version :plot_poster, from_version: :large do
    # crp = { "x" => 100, "y" => 100, "width" => 100, "height" => 100}
    # process :crop
    process :resize_to_fill => [300,300,:face]
    # cloudinary_transformation :transformation => [{:x => 100,:y => 100,
    #   :width => 100, :height => 100, :crop => :crop}, {effect: "sepia"}]

  end

  def crop
    if model.crop_x.present?
      resize_to_limit(600,600)
      # cloudinary_transformation :transformation => [{:x => 100,:y => 100,
      # :width => 100, :height => 100, :crop => :crop}, {effect: "sepia"}]
      manipulate! do |img|
      x = model.crop_x
      y = model.crop_y
      w = model.crop_w
      h = model.crop_h

      args = "#{w}x#{h}+#{x}+#{y}"
      # w << 'x' << h << '+' << x << '+' << y

      img.crop(args)
      img
    end
    end

  end
  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end
  def extension_white_list
    %w(jpg png jpeg)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
