class Comment < ActiveRecord::Base 

    belongs_to :posts
    belongs_to :user
    

    validates :body, presence: true 
    validates :body, length: { maximum: 50 }

end 