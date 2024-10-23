class SelectCategory < ApplicationRecord
  # has_many :store_comments, dependent: :destroy
  belongs_to :user,optional: false
  belongs_to :category,optional: false
  belongs_to :group,optional: false
end
