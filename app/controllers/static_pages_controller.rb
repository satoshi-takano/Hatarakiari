class StaticPagesController < ApplicationController
  def send_message
    ContactMailer.send_message(params[:mail_body]).deliver
    render :text=>"ok"
  end
end
