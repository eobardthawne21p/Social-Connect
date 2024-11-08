class PostsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :require_login
  before_action :set_post, only: %i[ show edit update destroy like unlike going not_going save unsave ]
  before_action :authorized_user!, only: %i[edit update destroy]

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
    @post = current_user.posts.build(post_params)
    @post.tags = extract_hashtags(@post.description) # Extract hashtags from description

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
    @post.tags = extract_hashtags(@post.description) # Update hashtags on description change
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
      @post.increment_likes!  # Increment likes count by 1 using Mongoid
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: "You liked this post." }
      format.json { render json: { likes: @post.likes.count }, status: :ok }  # Return like count
      format.turbo_stream { render turbo_stream: turbo_stream.replace("like-frame", partial: "posts/like_section", locals: { post: @post }) }  # Turbo Stream response
    end
  end

  # POST /posts/1/unlike
  def unlike
    like = current_user.likes.where(post: @post).first  # Use Mongoid syntax
    if like
      like.destroy  # Remove the like record
      @post.decrement_likes!  # Decrement likes count by 1 using Mongoid
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: "You unliked this post." }
      format.json { render json: { likes: @post.likes.count }, status: :ok }  # Return like count
      format.turbo_stream { render turbo_stream: turbo_stream.replace("like-frame", partial: "posts/like_section", locals: { post: @post }) }  # Turbo Stream response
    end
  end

  # POST /posts/1/save
  def save
    if current_user.saved_posts.where(post: @post).first.nil?  # Use Mongoid syntax
      current_user.saved_posts.create(post: @post)
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: "Post was successfully saved." }
      format.json { head :ok }
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(dom_id(@post, :bookmark), partial: "posts/bookmark_section", locals: { post: @post })
      end
    end
  end

  # POST /posts/1/unsave
  def unsave
    save = current_user.saved_posts.where(post: @post).first  # Use Mongoid syntax
    if save
      save.destroy
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: "Post was successfully unsaved." }
      format.json { head :no_content }
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(dom_id(@post, :bookmark), partial: "posts/bookmark_section", locals: { post: @post })
      end
    end
  end

  # POST /posts/:id/going
  def going
    if current_user.goings.where(post: @post).first.nil?  # Check if user hasn't marked as going
      current_user.goings.create(post: @post)
      @post.increment_goings!  # Increment goings count by 1
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: "You are going to this event." }
      format.json { render json: { goings: @post.goings }, status: :ok }
      format.turbo_stream { render turbo_stream: turbo_stream.replace("going-frame", partial: "posts/going_section", locals: { post: @post }) }
    end
  end

  # POST /posts/:id/not_going
  def not_going
    going = current_user.goings.where(post: @post).first
    if going
      going.destroy  # Remove the going record
      @post.decrement_goings!  # Decrement goings count by 1
    end

    respond_to do |format|
      format.html { redirect_to @post, notice: "You are no longer going to this event." }
      format.json { render json: { goings: @post.goings }, status: :ok }
      format.turbo_stream { render turbo_stream: turbo_stream.replace("going-frame", partial: "posts/going_section", locals: { post: @post }) }
    end
  end

  # Unified search action for hashtag, location, date, and title
  def results
    query = params[:query].to_s.strip.downcase
    @posts = Post.all

    if query.present?
      # Check for hashtag search (starts with #)
      if query.start_with?("#")
        hashtag = query[1..]  # Remove the '#' symbol
        @posts = @posts.where(tags: hashtag)
      else
        # General search for location, title, or date
        @posts = @posts.or({ location: /#{Regexp.escape(query)}/i })
                       .or({ title: /#{Regexp.escape(query)}/i })
                       .or({ description: /#{Regexp.escape(query)}/i })
                       
        # Check if query is a date
        begin
          date = Date.parse(query)
          @posts = @posts.or({ :created_at => date.beginning_of_day..date.end_of_day })
        rescue ArgumentError
          # Ignore if query is not a valid date
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def authorized_user!
      unless @post.user == current_user
        flash[:alert] = case action_name
        when "edit"
          "You are not authorized to edit this post"
        when "destroy"
          "You are not authorized to delete this post"
        else
          "You are not authorized to access this post"
        end
        redirect_to root_path
      end
    end

    def extract_hashtags(text)
      text.scan(/#\w+/).map(&:downcase).uniq # Extracts unique hashtags, stores them in lowercase
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :image, :location, :timeDate, :likes, :tags)
    end
end
