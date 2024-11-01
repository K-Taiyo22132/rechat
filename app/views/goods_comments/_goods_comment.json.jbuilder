json.extract! goods_comment, :id, :comment, :goods_review_id, :user_id, :evaluation, :created_at, :updated_at
json.url goods_comment_url(goods_comment, format: :json)
