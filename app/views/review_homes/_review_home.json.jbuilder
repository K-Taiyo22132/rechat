json.extract! review_home, :id, :category_id, :goods_review_id, :store_review_id, :group_id, :created_at, :updated_at
json.url review_home_url(review_home, format: :json)
