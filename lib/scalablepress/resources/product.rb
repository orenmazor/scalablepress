module Scalablepress
  class Product
    attr_reader :name
    attr_reader :product_id

    def initialize(params)
      @name = params["name"]
      @product_id = params["id"]
    end

    def product_info
      return @product_info if @product_info
      @product_info = API.get("products/#{@product_id}")
    end

    def colors
      @colors = product_info["colors"]
      @colors.map {|c| c["name"] }
    end

    def images_for_color(color)
      matched_color = product_info["colors"].select {|c| c["name"] == color }.first
      return unless matched_color
      images = matched_color["images"]
      return unless images.any?
      images.map {|x| x["url"] }
    end

    def self.all
      Category.all.map {|c| c.products }.flatten
    end
  end
end
