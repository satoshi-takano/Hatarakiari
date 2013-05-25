# -*- coding: utf-8 -*-

class Work < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image_0, :styles => { :thumb => "320x280#", :large => "640x480#"}
  has_attached_file :image_1, :styles => { :thumb => "320x280#", :large => "640x480#"}
  has_attached_file :image_2, :styles => { :thumb => "320x280#", :large => "640x480#"}
  has_attached_file :image_3, :styles => { :thumb => "320x280#", :large => "640x480#"}
  has_attached_file :image_4, :styles => { :thumb => "320x280#", :large => "640x480#"}
  
  attr_accessible :client, :description, :name, :private_work, :role, :url, :year, :user_id, :image_0, :image_1, :image_2, :image_3, :image_4
  

  validates_presence_of :name, :year, :user_id
  validates_numericality_of :year

  validates_attachment_presence :image_0
  validates_attachment_content_type :image_0, :image_1, :image_2, :image_3, :image_4, :content_type => %w{ image/jpeg image/png image/gif }

  after_initialize :init

  def init
    self.year ||= Time.now.year
  end

  def url=(u)
    unless /(?:http:\/\/)|(?:https:\/\/)/
      u = "http://" + u
    end
    write_attribute(:url, u)
  end
  
  def thumbnail_url
    "/images/" + self.id.to_s + "/thumbnail.png"
  end

  def description
    parsed = super
    ms = parsed.scan(/\[(.*?)\]\s?\((.*?)\)/)
    for m in ms
      regex = "\\[#{m[0]}\\]\\s?\\((#{m[1]})\\)"
      parsed.gsub!(Regexp.new(regex), "<a href='#{m[1]}'>#{m[0]}</a>")
    end
    parsed
  end

  def parsed_url
    u = url
    u.gsub(/\(公開終了\)/, "")
  end

  def url_article
    u = url
    u =~ /(\(公開終了\))/
    $1
  end
end
