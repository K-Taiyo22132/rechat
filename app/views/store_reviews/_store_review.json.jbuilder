json.extract! store_review, :id, :title, :review_image, :review, :spot, :tell, :category_id, :user_id, :group_id, :created_at, :updated_at, :grade
json.url store_review_url(store_review, format: :json)
