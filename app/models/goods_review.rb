class GoodsReview < ApplicationRecord
  has_many :goods_comments, dependent: :destroy
  belongs_to :category,optional: false
  belongs_to :user,optional: false
  belongs_to :group,optional: false

  enum evaluation: { "★☆☆☆☆": 1,"★★☆☆☆": 2,"★★★☆☆": 3,"★★★★☆": 4,"★★★★★": 5 }
  
end
