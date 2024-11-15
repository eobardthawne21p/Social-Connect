class ChatBoardsController < ApplicationController
  before_action :set_chat_board, only: %i[show edit update destroy]
  before_action :authorize_user!, only: [ :destroy ]

  # GET /chat_boards
  def index
    @chat_boards = ChatBoard.all
  end

  # GET /chat_boards/1
  def show
  end

  # GET /chat_boards/new
  def new
    @chat_board = ChatBoard.new
  end

  # POST /chat_boards
  def create
    @post = Post.find_by(id: params[:post_id])
    if @post.nil?
      redirect_to fallback_post_path, alert: "Post not found." and return
    end

    @chat_board = @post.chat_boards.build(chat_board_params)
    @chat_board.user_id = current_user.id
    respond_to do |format|
      if @chat_board.save
        format.html { redirect_to post_path(@post), notice: "Comment was successfully posted." }
        format.json { render :show, status: :created, location: @chat_board }
      else
        format.html { redirect_to post_path(@post), alert: "Failed to post comment." }
        format.json { render json: @chat_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_boards/1
  def update
    respond_to do |format|
      if @chat_board.update(chat_board_params)
        format.html { redirect_to posts_path(@chat_board.post_id), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @chat_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_boards/1
  def destroy
    post_id = @chat_board.post_id
    @chat_board.destroy

    respond_to do |format|
      format.html { redirect_to post_path(post_id), notice: "Comment was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Set post object for create and index actions
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def chat_board_params
    params.require(:chat_board).permit(:content, :post_id)
  end

  def set_chat_board
    @chat_board = ChatBoard.find(params[:id])
  end

  def authorize_user!
    unless current_user && (current_user == @chat_board.user || current_user.admin? || current_user.moderator?)
      redirect_to post_path(@chat_board.post), alert: "You are not authorized to delete this comment."
    end
  end
end
