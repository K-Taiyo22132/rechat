json.extract! goods_review, :id, :title, :review_image, :review, :evaluation, :price, :category_id, :user_id, :group_id, :created_at, :updated_at
json.url goods_review_url(goods_review, format: :json)
