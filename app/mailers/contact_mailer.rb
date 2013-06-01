# -*- coding:utf-8 -*-
class ContactMailer < ActionMailer::Base
  default from: "contact@hataraki.in"
  default to: Hataraki::Application.config.mailto

  def send_message(body)
    mail(:subject=>'hatarakiフォームからのメッセーッジ', :body=>body)
  end
end
