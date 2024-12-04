json.extract! chat_board, :id, :content, :post_id, :user_id, :created_at, :updated_at
json.url chat_board_url(chat_board, format: :json)
