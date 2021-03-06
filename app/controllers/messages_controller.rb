class MessagesController < ApplicationController
  def index
    if  current_user
      @partners = current_user.message_partners
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @partner = User.find(params[:id])
    @messages = current_user.messages_with(@partner)
    @message = Message.new(to_id: @partner.id)
    render :show, layout: false
  end

  def create
    message = Message.create(params[:message])
    render partial: 'message', locals: { current_user: current_user, partner: message.to, message: message}
  end
end

