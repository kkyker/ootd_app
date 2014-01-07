class PostsController < ApplicationController
  before_filter :signed_in_user,
                only: [:show, :update_likes, :most_liked, :most_expensive, :create, :destroy]
  def new
  	@new_post = Post.new
  end

  def index
  	@Posts = Post.all.order("posts.created_at desc")
  end

  def update_likes
  	@post = Post.find(params[:id])
    if !@post.liked_users.include?(current_user.name)
  	   @post.likes += 1
       @post.liked_users.push(current_user.name)
       @post.save
    end
  	redirect_to :back
  end

  def most_liked
    @Posts = Post.all.sort_by!{|post| post.likes}.reverse!
  end

  def most_expensive
    @Posts = Post.all.sort_by!{|post| post.price}.reverse!
  end

  def create
  	@post = Post.new(posts_params)
  	@post.likes = 0
    @post.user_id = current_user.id
  	if @post.save
  		redirect_to current_user
  	else
      flash[:error] = "#{@post.errors.full_messages}"
  		redirect_to :back
  	end
  end

  def destroy
  end

  private

  def posts_params
  	params.require(:post).permit(:price, :content, :image)
  end

  def signed_in_user
    unless signed_in?
      redirect_to signin_path, notice: "Please sign in." 
    end
  end

end
