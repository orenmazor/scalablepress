require "minitest/autorun"
require "scalablepress"
require File.dirname(__FILE__) + '/test_helper'

class TestCategory < Minitest::Test
  def test_we_get_categories
    categories = Scalablepress::Category.all
    assert categories.any?
    assert categories.first.is_a?(Scalablepress::Category)
  end
end
