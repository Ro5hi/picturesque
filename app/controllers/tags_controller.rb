class TagsController < ApplicationController

    before_action :set_tag, only: [:index, :show]

    def index
        @tags = Tag.all
    end

    def show 
        binding.pry
        @post = Post.find_by(params[:tag])
        @tag = Tag.find_by(params[:name])
        @tags = Tag.find_by(params[:id])
    end 

    private

    def set_tag 
        @tag = Tag.where(params[:id])
    end 

end 
