class Chat < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :message,optional: false
end
