require "minitest/autorun"
require "scalablepress"
require File.dirname(__FILE__) + '/test_helper'

class TestProduct < Minitest::Test
  def setup
    @products = Scalablepress::Product.all
  end

  def test_we_get_all_products
    assert @products.any?
  end

  def test_a_product_knows_its_colors
    colors = @products.select {|p| p.name == "Bella Sheer Mini Rib Racerback"}.colors
    assert_equal [], colors
  end
end
