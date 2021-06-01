class PostsController < ApplicationController
  before_action :set_post, only: [:show, :show, :update, :destroy]

  def admin_types
    ['AdminUser']
  end

  def index
    if admin_types.include?(current_user.type)
      @posts = Post.all.page(params[:page])
    else
      @posts = Post.posts_by(current_user).page(params[:page])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, success: 'Your post was created successfully'
    else
      redirect_to new_post_path, danger: @post.errors.full_messages.to_sentence
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update(post_params)
      redirect_to @post, success: 'Your post was edited successfully'
    else
      render :edit, danger: @post.errors.full_messages.to_sentence
    end
  end

  def show
    # @post = Post.find(params[:id])
    # authorize @post
  end

  def destroy
    authorize @post
    @post.delete
    redirect_to posts_path, success: 'Your post was deleted successfully'
  end

  private

    def post_params
      params.require(:post).permit(:overtime_request, :date, :rationale, :status)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
