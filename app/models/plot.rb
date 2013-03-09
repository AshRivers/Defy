class Plot < ActiveRecord::Base
  attr_accessible :first_stp, :name, :poster, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  has_many :storypoints, dependent: :destroy
  belongs_to :user, foreign_key: "plot_id"

  after_update :crop_poster

  validates :name, :user_id, presence: true
  validates_uniqueness_of :name, scope: :user_id

  mount_uploader :poster, ImageUploader

  def crop_poster
    poster.recreate_versions! if crop_x.present?
  end
end
