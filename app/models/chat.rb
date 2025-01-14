class Chat < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :messags
end
