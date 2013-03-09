class Storypoint < ActiveRecord::Base
  attr_accessible :image, :name, :story, :plot_id,
  					:crop_x, :crop_y, :crop_w, :crop_h

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_image

  has_many :ways, foreign_key: "from_storypoint", dependent: :destroy
  belongs_to :plot, foreign_key: "plot_id"

  default_scope order: 'storypoints.plot_id'

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {maximum: 50}#, if: :name_changed?
  validates_uniqueness_of :name, scope: :plot_id

  # def name_changed?
  # 	!@name.blank?
  # end

    def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
