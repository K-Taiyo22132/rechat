class GoodsComment < ApplicationRecord
  belongs_to :goods_review,optional: false
  belongs_to :user,optional: false
end
