require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Photo < ActiveRecord::Base

    belongs_to :user
    belongs_to :post 

end 