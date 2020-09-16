class TagsController < ApplicationController

    before_action :set_tag, only: [:index, :show]

    def show
        if params[:tags]
            @posts = Post.tag(params[:tags])
          else
            @posts = Post.all.limit(10)
        end 
    end  
    
    private

    def set_tag 
        @post = Post.find_by(name: params[:name])
    end 

end 
