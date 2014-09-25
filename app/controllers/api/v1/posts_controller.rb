class Api::V1::PostsController < Api::ApiController
    def index
        @posts = Post.all
        if @posts.present?
      render :status => :ok, :json =>  @posts.order("id desc")
    else
      render :status => :not_found, :json => {:message => 'Posts not found'}
    end
        end



    def create
       @post =Post.new(posts_params)

    if @post.save
      render :status => :ok, :json => {:message => "Successfully created the Activity"}
    else
      render :status => :bad_request, :json => {:message => "Invalid Activity"}
    end


        end

    def posts_params
    params.require(:post).permit(:title, :comment)
  end

end
