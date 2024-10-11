class Category < ApplicationRecord
  has_many :groups, dependent: :restrict_with_error
  # has_many :stores_reviews, dependent: :restrict_with_error
  # has_many :goods_reviews, dependent: :restrict_with_error
  # has_many :select_categories, dependent: :restrict_with_error
end
