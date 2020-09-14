require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base 

    belongs_to :user
    has_many :comments

    has_many :tags, through: :hashes
    has_many :hashes, :as => :hashtags
    
    mount_uploader :photo, PhotoUploader
    serialize :photo, JSON

    validates_presence_of :photo
    validates :caption, length: { maximum: 150 }

    before_create :set_active 

    scope :active, -> { where(active: true) }

    def photo_presence
        errors.add(:photo, "Can't be blank.") unless photo.attached?
    end 

    def set_active 
        self.active = true 
    end 

    def tags=(names)
        self.tags= names.split(',').map do |name|
            Tag.where(params[:name]).first_or_create!
        end 
    end 

    def tags 
        tags.map(&:name).join(", ")
    end 
    
end