class Photo < ActiveRecord::Base

    belongs_to :user
    belongs_to :post 

    mount_uploader :photo, PhotoUploader
    serialize :photo, JSON


end 