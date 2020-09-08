require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base 

    belongs_to :user

    mount_uploader :photo, PhotoUploader
    serialize :photo, JSON

    validates_presence_of :photo
    
    scope :active, -> { where active: true }

end 