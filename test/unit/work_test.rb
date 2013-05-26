require 'test_helper'

class WorkTest < ActiveSupport::TestCase

  test "work.year is set to current year as default" do
    w = Work.new
    assert_equal w.year, Time.now.year
  end

  test "work.url is auto formated to URL" do
    w = Work.new
    w.url = ""
    assert_equal w.url, ""

    w.url = "example.com"
    assert_equal "http://example.com", w.url
    w.url = "http://example.com"
    assert_equal "http://example.com", w.url
    w.url = "https://example.com"
    assert_equal "https://example.com", w.url    
  end
    
end
