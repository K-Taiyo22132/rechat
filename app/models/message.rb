class Message < ApplicationRecord
  belongs_to :group,optional: false
  belongs_to :user,optional: false
  has_many :chats, dependent: :restrict_with_error
  after_create_commit { MessageBroadcastJob.perform_later self }
end
