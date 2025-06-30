class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    posts = Post.all
    render json: posts, status: :ok
  end

  # GET /posts/:id
  def show
    if @post
      render json: @post, status: :ok
    else
      render json: { error: 'Post not found' }, status: :not_found
    end
  end

  # POST /posts
  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /posts/:id
  def update
    if @post&.update(post_params)
      render json: @post, status: :ok
    else
      render json: { error: 'Post not found or update failed' }, status: :not_found
    end
  end

  # DELETE /posts/:id
  def destroy
    if @post&.destroy
      render json: { message: 'Post deleted' }, status: :ok
    else
      render json: { error: 'Post not found' }, status: :not_found
    end
  end

  private
    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:user_id, :title, :content)
    end
end
