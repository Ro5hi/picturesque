class TagsController < ApplicationController

    before_action :set_tag, only: [:index, :show]

    def index
        @tags = Tag.all
        @tag = Tag.find_by(name: params[:name])
    end

    def show 
        @post = Post.find_by(params[:id])
    end 

    private

    def set_tag 
        @tag = Tag.where(params[:id])
    end 

end 
