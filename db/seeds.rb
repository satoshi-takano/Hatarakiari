# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([{ name:"satoshi-takano", provider:"github", uid: 2128268, avatar_url: "https://secure.gravatar.com/avatar/92dbb6226bf8df2adf6e7c3b111a29dc?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars" }])
works = Work.create([
    { name:"TrainAlarm", year:2012, client:"self", url:"https://itunes.apple.com/jp/app/trainalarm/id459067243?mt=8", role:"iOS", personal_work:false, user_id:1, description:"設定した駅に近づくとアラームで起こしてくれるiPhoneアプリです。", image_0:File.open("#{Rails.root}/db/files/trainalarm/0.png"), image_1:File.open("#{Rails.root}/db/files/trainalarm/1.png"), image_2:File.open("#{Rails.root}/db/files/trainalarm/2.png"), image_3:File.open("#{Rails.root}/db/files/trainalarm/3.png"), image_4:File.open("#{Rails.root}/db/files/trainalarm/4.png") },
    { name:"Cloud DJ", year:2013, client:"self", url:"https://itunes.apple.com/jp/app/cloud-dj/id532825892?mt=8", role:"iOS", personal_work:false, user_id:1, description:"Cloud DJはPC、スマートフォンの中で唯一、<a href='http://soundcloud.com'>SoundCloud</a>上の音楽をストリーミングしながらDJプレイが楽しめるアプリケーションです。", image_0:File.open("#{Rails.root}/db/files/clouddj/0.png"), image_1:File.open("#{Rails.root}/db/files/clouddj/1.png"), image_2:File.open("#{Rails.root}/db/files/clouddj/2.png"), image_3:File.open("#{Rails.root}/db/files/clouddj/3.png") },
    { name:"hataraki", year:2013, client:"self", url:"http://hataraki.in", role:"Frontend,Backend", personal_work:true, user_id:1, description:"hatarakiはクリエーターのための鍵付きポートフォリオサービスです。\n仕事、プライベートで制作したものを記録して人に見せたい。でも、不特定多数に無条件で公開されてしまうのは都合が悪い。\nhatarakiはそんなニーズを満たすためのサービスです。", image_0:File.open("#{Rails.root}/db/files/hataraki/0.png"), image_1:File.open("#{Rails.root}/db/files/hataraki/1.png"), image_2:File.open("#{Rails.root}/db/files/hataraki/2.png"), image_3:File.open("#{Rails.root}/db/files/hataraki/3.png") }        
])

Guest.create([{ login_id:"guest01", login_password:"i_am_a_guest", user_id:1}])
