require 'carrierwave'
require 'carrierwave/orm/activerecord'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauth_providers => [:twitter]
  
        has_many :posts, dependent: :destroy 
        has_many :comments

        validates :name, presence: true 
        validates :username, presence: true
        validates :username, uniqueness: true 
        validates :description, length: { maximum: 50 } 

        # scope: :user_posts, -> {where length(@user.posts) > 3 }}

  mount_uploader :photo, PhotoUploader
  serialize :photo, JSON

  def self.from_omniauth(auth_hash)
    user = where(uid: auth_hash.uid).first_or_create
    user.update(
      email: auth_hash.info.email
    )
    if !user.id
      user.update(password: SecureRandom.hex)
    end
    user
  end

  def profile_photo 
    @user = User.find(params[:photo])
  end 
  
end 
