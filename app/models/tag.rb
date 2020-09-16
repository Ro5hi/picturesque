class Tag < ActiveRecord::Base 

    has_many :taggs
    has_many :posts, :through => :taggs, :source => :taggable,
    :source_type => 'Post'

    # scope -> :searchable => where(searchable: true) 

    def self.searchable 
        if @post.tags.present?
            self.searchable = true 
        else
            self.searchable = nil
        end 
    end 

end 