json.extract! select_category, :id, :user_id, :category_id, :created_at, :updated_at
json.url select_category_url(select_category, format: :json)
