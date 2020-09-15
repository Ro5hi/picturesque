class Tag < ActiveRecord::Base 

    has_many :taggs
    has_many :posts, :through => :taggs, :source => :taggable,
    :source_type => 'Post'

end 