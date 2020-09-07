class Post < ActiveRecord::Base 

    belongs_to :user

    mount_uploader :photo, PhotoUploader
    serialize :photo, JSON
    

end 