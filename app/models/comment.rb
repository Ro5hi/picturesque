class Comment < ActiveRecord::Base 

    has_many :posts, through: :user
    belongs_to :user
    

    validates :body, presence: true 
    validates :body, length: { maximum: 50 }

end 