class TagsController < ApplicationController

    before_action :set_tag, only: [:index]

    def index
        @tags = Tag.all
        @tag = Tag.where(params[:name])
    end

    def show 
        @tag = Tag.find_by(params[:id])
    end 

    private

    def set_tag 
        @tag = Tag.find_by(name: params[:name])
    end 

end 
