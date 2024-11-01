json.extract! store_comment, :id, :comment, :store_review_id, :user_id, :created_at, :updated_at
json.url store_comment_url(store_comment, format: :json)
