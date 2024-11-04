require "application_system_test_case"

class ChatBoardsTest < ApplicationSystemTestCase
  setup do
    @chat_board = FactoryBot.create(:chat_board)
  end

  test "visiting the index" do
    visit chat_boards_url
    #assert_selector "h1", text: "Chat boards"
  end

  test "should create chat board" do
    visit chat_boards_url
    click_on "New chat board"

    fill_in "Content", with: @chat_board.content
    fill_in "Post", with: @chat_board.post_id
    fill_in "User", with: @chat_board.user_id
    click_on "Create Chat board"

    assert_text "Chat board was successfully created"
    click_on "Back"
  end

  test "should update Chat board" do
    visit chat_board_url(@chat_board)
    click_on "Edit this chat board", match: :first
    #fill_in "Post", with: @chat_board.post_id
    fill_in "User", with: @chat_board.user_id
    fill_in "Content", with: @chat_board.content
    click_on "Update Chat board"

    assert_text "Chat board was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat board" do
    visit chat_board_url(@chat_board)
    click_on "Destroy this chat board", match: :first

    assert_text "Chat board was successfully destroyed"
  end
end
