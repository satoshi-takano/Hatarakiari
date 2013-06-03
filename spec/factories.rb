require 'factory_girl'
FactoryGirl.define do
  factory :work1, :class=>Work do
    name "work 1"
    url "test.hataraki.in"
    description "I am a <a href='https://www.google.co.jp/search?q=cat'>cat</a>. <script type='text/javascript'>alert('this script tag will be removed')</script>"
  end
  factory :work2, :class=>Work do
    name "work 2"
    url "http://test.hataraki.in"
    description "I am a <a href='https://www.google.co.jp/search?q=cat'>cat</a>. <script type='text/javascript'>alert('this script tag will be removed')</script>"    
  end
  factory :work3, :class=>Work do
    name "work 3"
    url "https://test.hataraki.in"
    description "I am a <a href='https://www.google.co.jp/search?q=cat'>cat</a>. <script type='text/javascript'>alert('this script tag will be removed')</script>"    
  end
  
  factory :work4, :class=>Work do
    name "work 1"
    year 2012
    client "self"
    url "http://google.com"
    role "Native"
    personal_work false
    description "foobar"
    image_0 File.open("#{Rails.root}/db/files/trainalarm/0.png")
  end

  factory :github_user, :class=>User do
    name "github user"
    provider "github"
    uid 123456
    avatar_url "http://avatar.hataraki.in"
    works { [FactoryGirl.create(:work4)]}
  end

  factory :guest1, :class=>Guest do
    login_id "guest1"
    login_password "password"
    memo "this is guest of first user"
    user_id 1
  end
end
