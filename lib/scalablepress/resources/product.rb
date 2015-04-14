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

    def color_list
      @colors = product_info["colors"]
      @colors.map {|c| c["name"] }
    end

    def image_urls_for(color)
      API.get("products/#{@product_id}")["colors"].select {|c| c["name"] == color }
    end

    def self.all
      Category.all.map {|c| c.products }.flatten
    end
  end
end
