class ChatBoardsController < ApplicationController
  before_action :set_chat_board, only: %i[ show edit update destroy ]

  # GET /chat_boards or /chat_boards.json
  def index
    @chat_boards = ChatBoard.all
  end

  # GET /chat_boards/1 or /chat_boards/1.json
  def show
  end

  # GET /chat_boards/new
  def new
    @chat_board = ChatBoard.new
  end

  # GET /chat_boards/1/edit
  def edit
  end

  # POST /chat_boards or /chat_boards.json
  def create
    @chat_board = ChatBoard.new(chat_board_params)

    respond_to do |format|
      if @chat_board.save
        format.html { redirect_to @chat_board, notice: "Chat board was successfully created." }
        format.json { render :show, status: :created, location: @chat_board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_boards/1 or /chat_boards/1.json
  def update
    respond_to do |format|
      if @chat_board.update(chat_board_params)
        format.html { redirect_to @chat_board, notice: "Chat board was successfully updated." }
        format.json { render :show, status: :ok, location: @chat_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_boards/1 or /chat_boards/1.json
  def destroy
    @chat_board.destroy!

    respond_to do |format|
      format.html { redirect_to chat_boards_path, status: :see_other, notice: "Chat board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_board
      @chat_board = ChatBoard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_board_params
      params.require(:chat_board).permit(:content, :post_id, :user_id)
    end
end
