require "test_helper"

class ChatBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, role: "moderator")
    @post = FactoryBot.create(:post, user: @user)
    @chat_board = FactoryBot.create(:chat_board, user: @user, post: @post)
    log_in(@user)
  end

  test "should get index" do
    get chat_boards_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_board_url
    assert_response :success
  end

  test "should create chat_board" do
    assert_difference("ChatBoard.count") do
      # Ensure you are posting to the nested route under a post
      post post_chat_boards_url(@post), params: { chat_board: { content: "New comment" } }
    end
    # Expect redirection to the post view or similar relevant path
    assert_redirected_to post_url(@post)
  end


  test "should show chat_board" do
    get chat_board_url(@chat_board)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_board_url(@chat_board)
    assert_response :success
  end

  test "should update chat_board" do
    patch chat_board_url(@chat_board), params: { chat_board: { content: @chat_board.content, post_id: @chat_board.post_id, user_id: @chat_board.user_id } }
    assert_redirected_to post_path(@chat_board.post_id)
  end

  test "should destroy chat_board" do
    assert_difference("ChatBoard.count", -1) do
      delete chat_board_url(@chat_board)
    end

    assert_redirected_to post_path(@chat_board.post)
  end
end
