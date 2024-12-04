json.extract! select_review, :id, :goods_review_id, :store_review_id, :created_at, :updated_at
json.url select_review_url(select_review, format: :json)
