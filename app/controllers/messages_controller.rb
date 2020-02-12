class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user).all
    @message = Message.new
  end

  def create
    @message = current_user.messages.build message_params
    @message.save
    ActionCable.server.broadcast "chat", {
      message: render_message(@message)
    }
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def render_message message
    MessagesController.render(
      partial: message,
      local: {
        message: message
      }
      )
  end
end
