class StoreComment < ApplicationRecord
  belongs_to :store_review,optional: false
  belongs_to :user,optional: false
end
