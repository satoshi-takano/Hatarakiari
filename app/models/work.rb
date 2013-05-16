# -*- coding: utf-8 -*-

class Work < ActiveRecord::Base
  has_many :guests, :dependent=> :delete_all
  
  attr_accessible :client, :description, :name, :private_work, :role, :url, :year
#  attr_accessor :client, :description, :name, :private_work, :role, :url, :year

  validates_presence_of :name, :year
  validates_numericality_of :year

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
