class PostsController < ApplicationController
  before_action :ensure_post_exists
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_modal_properties

  # GET /posts
  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  # GET /posts/1
  def show
    @modal_title = @post.title
  end

  # GET /posts/new
  def new
    @post = Post.new
    @modal_title = "New Post"
  end

  # GET /posts/1/edit
  def edit
    @modal_title = "Edit Post"
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @modal_title = "New Post"

    if @post.save
      redirect_to "/",
                  notice: "Post was successfully created.",
                  status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)      
      notice = "✅ Post updated at #{@post.updated_at.strftime('%H:%M:%S')}"
      status = :see_other

      path = if params[:redirect_to_index]
        posts_path
      else
        post_path(@post)
      end

      redirect_to path, status:, notice:
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_path,
                notice: "🗑️ Post '#{@post.title}' was deleted at #{Time.current.strftime('%H:%M:%S')}",
                status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :publish_on)
  end
end
