module PostsHelper

    def link(tag_list)
        tag_list.gsub(/\w+/){|name| link_to name, "/posts/tag/#{:tag}"}.html_safe
    end 
     
end 