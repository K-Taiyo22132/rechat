class Message < ApplicationRecord
  belongs_to :groop,optional: false
  belongs_to :user,optional: false
end
