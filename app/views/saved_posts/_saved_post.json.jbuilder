json.extract! saved_post, :id, :user_id, :post_id, :created_at, :updated_at
json.url saved_post_url(saved_post, format: :json)
