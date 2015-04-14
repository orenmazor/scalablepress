require "minitest/autorun"
require "scalablepress"
require File.dirname(__FILE__) + '/test_helper'

class TestProduct < Minitest::Test
  def setup
    @products = Scalablepress::Product.all
  end

  def test_we_get_all_products
    assert @products.any?
    assert @products.first.is_a?(Scalablepress::Product)
  end

  def test_a_product_knows_its_colors
    matching_shirts = @products.select {|p| p.name == "Bella Sheer Mini Rib Racerback"}
    assert matching_shirts.count == 1 
    assert_equal ["Berry", "Black", "Chocolate", "Midnight", "Moss Green", "Ocean Blue", "Orange Sorbet", "Pale Blue", "Pink", "Plum", "Red", "Teal", "White"], matching_shirts.first.colors
  end

  def test_a_product_knows_its_images
    shirt = @products.select {|p| p.name == "Bella Sheer Mini Rib Racerback"}.first
    assert_equal ["https://www.alphabroder.com/images/alp/sideDetail/8770_sd_60_p.jpg", "https://www.alphabroder.com/images/alp/prodDetail/8770_60_p.jpg", "https://www.alphabroder.com/images/alp/backDetail/8770_bk_60_p.jpg"], shirt.images_for_color("Berry")
  end

  def test_a_product_raises_on_invalid_color
    shirt = @products.select {|p| p.name == "Bella Sheer Mini Rib Racerback"}.first
    assert_raises(RuntimeError) do
      shirt.images_for_color("waldo")
    end
  end
end
