# -*- coding:utf-8 -*-
class ContactMailer < ActionMailer::Base
  default from: "contact@hataraki.in"
  default to: Hatarakiari::Application.config.mailto

  def send_message(body)
    mail(:subject=>'hatarakiフォームからのメッセーッジ', :body=>body)
  end
end
