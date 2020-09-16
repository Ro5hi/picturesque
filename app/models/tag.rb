class Tag < ActiveRecord::Base 

    has_many :taggs
    has_many :posts, :through => :taggs, :source => :taggable,
    :source_type => 'Post'

    after_create :set_searchable 

    scope :searchable, -> { where(searchable: true) } 

    def set_searchable 
        if @post.tag_list.present?
            self.searchable = true 
        end 
    end 

end 