class PostsController < ApplicationController
  before_action :require_login
  before_action :set_post, only: %i[ show edit update destroy like unlike ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /posts/1/like
  def like
    if current_user.likes.where(post: @post).first.nil?  # Use Mongoid syntax
      current_user.likes.create(post: @post)
      @post.increment!(:likes)  # Increment likes count
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: "You liked this post." }
      format.json { render json: { likes: @post.likes.count }, status: :ok }  # Return like count
    end
  end

  # POST /posts/1/unlike
  def unlike
    like = current_user.likes.where(post: @post).first  # Use Mongoid syntax
    if like
      like.destroy  # Remove the like record
      @post.decrement!(:likes)  # Decrement likes count
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: "You unliked this post." }
      format.json { render json: { likes: @post.likes.count }, status: :ok }  # Return like count
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :image, :location, :timeDate, :likes)
    end
end
