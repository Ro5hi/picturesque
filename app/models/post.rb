require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Post < ActiveRecord::Base 

    belongs_to :user
    has_many :comments

    has_many :taggs 
    has_many :tags, through: :taggs   

    mount_uploader :photo, PhotoUploader
    serialize :photo, JSON

    validates_presence_of :photo
    validates :caption, length: { maximum: 150 }

    before_create :set_active 
    # saves posts in DB 
    scope :active, -> { where(active: true) }

    def set_active 
        self.active = true 
    end

    def self.tagged_with(name)
        Tag.find_by_name!(name).posts
    end
    
    def tag_list
        tags.map(&:name).join(', ')
    end
    
    def tag_list=(names)
        self.tags = names.split(',').map do |n|
          Tag.where(name: n.strip).first_or_create!
        end 
    end

end 