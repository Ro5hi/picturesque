class TagsController < ApplicationController

    before_action :set_tag, only: [:index]

    def index
        @tags = Tag.includes(params[:name])
        @tagg = Tagg.includes(params[:tag_id])
    end

    def show
        tag = Tag.find_by(name: params[:name])
        @tagg = Tagg.where(tag_id: tag.id)
        post_ids = @tagg.map {|t| t.post_id}
        @posts = Post.where(id: post_ids)
        if @posts.length == 0
            redirect_to tags_path, notice: "No posts with this tag."
        end             
    end

    private

    def set_tag 
        @tag = Tag.where(params[:id])
    end 

end 
