require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  require 'carrierwave/orm/activerecord'
  
  attr_accessible :email, :image, :name, :password, :password_confirmation,
                    :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :password, :crop_x, :crop_y, :crop_w, :crop_h
  before_save :encrypt_password#, :unless => Proc.new { |u| u.password.blank? }
  after_update :crop_image

  mount_uploader :image, ImageUploader

  email_regexp = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :plots, dependent: :destroy

  validates :name, 		presence: true, 
  						uniqueness: true,
              length: {maximum: 33}
  validates :email, 	presence: true, 
              format: {with: email_regexp},
  						uniqueness: {case_sensetive: false}
  validates :password, 	presence: true, 
  						confirmation: true,
              length: {within: 6..30}, if: :pass_changed?#, on: :create

  def pass_changed?
    !@password.blank?
  end

  def self.authenticate(email,password)
  	user = User.find_by_email(email)
  	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  		user
  	else 
  		nil
  	end
  end

  def encrypt_password
  	if password.present?
  		self.password_salt = BCrypt::Engine.generate_salt
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
