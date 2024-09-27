require "test_helper"

class ChatBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_board = chat_boards(:one)
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
      post chat_boards_url, params: { chat_board: { content: @chat_board.content, post_id: @chat_board.post_id, user_id: @chat_board.user_id } }
    end

    assert_redirected_to chat_board_url(ChatBoard.last)
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
    assert_redirected_to chat_board_url(@chat_board)
  end

  test "should destroy chat_board" do
    assert_difference("ChatBoard.count", -1) do
      delete chat_board_url(@chat_board)
    end

    assert_redirected_to chat_boards_url
  end
end
