class Tag < ActiveRecord::Base 

    has_many :hashes
    has_many :posts, :through => :hashes, :source => :taggable,
    :source_type => 'Post'

end 