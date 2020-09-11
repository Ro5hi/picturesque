require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base 

    belongs_to :user
    has_many :comments, through: :users

    mount_uploader :photo, PhotoUploader
    serialize :photo, JSON

    validates_presence_of :photo
    before_create :set_active 
    scope :active, -> { where active: true }

    def photo_presence
        errors.add(:photo, "can't be blank") unless photo.attached?
    end 

end 