require "minitest/autorun"
require "scalablepress"
require File.dirname(__FILE__) + '/test_helper'

class TestProduct < Minitest::Test
  def setup
    @products = Scalablepress::Category.find_by_id("ladies-tank-tops").products
  end

  def test_we_get_all_products
    assert @products.any?
    assert @products.first.is_a?(Scalablepress::Product)
  end

  def test_a_product_knows_its_colors
    matching_shirts = @products.select {|p| p.name == "Bella Sheer Triblend Racerback"}
    assert matching_shirts.count == 1 
    expected = ["Charcoal Triblend", "Emerald Triblend", "Grey Triblend", "Blue Triblend", "Green Triblend", "Red Triblend", "Wht Flck Triblnd"]

    assert_equal expected, matching_shirts.first.colors
  end

  def test_a_product_knows_its_images
    shirt = @products.select {|p| p.name == "Bella Sheer Triblend Racerback"}.first
    expected = ["http://i1.ooshirts.com/images/lab_shirts/Charcoal-Triblend-212-F.jpg", "http://i1.ooshirts.com/images/lab_shirts/Charcoal-Triblend-212-B.jpg"]
    assert_equal expected, shirt.images_for_color("Charcoal Triblend")
  end

  def test_a_product_raises_on_invalid_color
    shirt = @products.select {|p| p.name == "Bella Sheer Triblend Racerback"}.first
    err = assert_raises(RuntimeError) do
      shirt.images_for_color("waldo")
    end

    assert_equal "waldo is invalid color selection for Charcoal Triblend, Emerald Triblend, Grey Triblend, Blue Triblend, Green Triblend, Red Triblend, Wht Flck Triblnd", err.message
  end

  def test_a_product_raises_on_no_images
    #this test currently works because scalablepress is broken here 
    shirt = @products.select {|p| p.product_id == "next-level-racerback-terry-tank"}.first
    err = assert_raises(RuntimeError) do
      shirt.images_for_color("White")
    end

    assert_equal "Found no images for White!", err.message
  end
end
