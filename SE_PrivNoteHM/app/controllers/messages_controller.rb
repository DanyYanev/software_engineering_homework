class MessagesController < ApplicationController

  def index
    render :new
  end

  def new
  end

  def show
    @message = Message.where(:url => params[:id]).first
    if @message.nil?
      render :not_found
    else
      @message.destroy
    end
  end

  def create
    @message = Message.new
    @message.text = params[:text]

    random = ""
    begin
      random = SecureRandom.hex(7)
    end while Message.where(:url => random).count > 0
    @message.url = random

    respond_to do |format|
      if @message.save
        format.html { render :created }
      else
        format.html { render :new }
      end
    end

    # render plain: "You can view the message at: #{request.original_url}/#{@message.url}";
  end

#  private
#  def message_params
#    params.require (:message).permit(:text)
#  end

end
