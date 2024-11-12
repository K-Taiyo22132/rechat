class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    # Do something later
    ActionCable.server.broadcast "group_channel_#{data.group_id}", message: render_message(data)
  end

  private
  def render_message(data)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: data} )
  end
end
