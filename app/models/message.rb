class Message < ApplicationRecord
  belongs_to :group,optional: false
  belongs_to :user,optional: false
  # belongs_to :chat,optional: false
  after_create_commit { MessageBroadcastJob.perform_later self }
end
