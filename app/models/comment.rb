class Comment < ActiveRecord::Base 

    belongs_to :user
    has_many :posts, through: :users 

    validates :body, presence: true 
    validates :body, length: { maximum: 50 }

end 