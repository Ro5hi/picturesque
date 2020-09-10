require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base 

    has_many :comments
    has_many :users, through: :comments

    mount_uploader :photo, PhotoUploader
    serialize :photo, JSON

    validates_presence_of :photo
    
    scope :active, -> { where active: true }

end 