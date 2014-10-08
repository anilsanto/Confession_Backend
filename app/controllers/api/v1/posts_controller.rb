class Api::V1::PostsController < Api::ApiController
    api :GET, '/posts'
    description <<-EOS
== List All posts

EOS
    def index
        @posts = Post.all
        if @posts.present?
            render :status => :ok, :json =>  @posts.order("id desc")
        else
            render :status => :not_found, :json => {:message => 'Post not found'}
        end
    end



    def create
        @post =Post.new(posts_params)

        if @post.save
            render :status => :ok, :json => {:message => "Successfully created the Post"}
        else
            render :status => :bad_request, :json => {:message => "Invalid post"}
        end


    end

    def update_flag
        @post=Post.find_by_id(params[:Post][:id])
        @post.flag_count+=1;
        if @post.save
            render :status => :ok, :json => {:message => "Successfully added the flag"}
        else
            render :status => :bad_request, :json => {:message => "Invalid id"}
        end

    end

    def posts_params
        params.require(:post).permit(:title, :comment)
    end

end
