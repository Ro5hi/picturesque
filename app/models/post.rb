require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base 

    belongs_to :user
    has_many :comments

    mount_uploader :photo, PhotoUploader
    serialize :photo, JSON

    validates_presence_of :photo
    validates :caption, length: { maximum: 150 }

    scope :active, -> { where active: true }

    def photo_presence
        errors.add(:photo, "Can't be blank") unless photo.attached?
    end 

end 