module Scalablepress
  class Category
    attr_reader :name
    attr_reader :category_id

    def initialize(params)
      puts params
      @name = params["name"]
      @category_id = params["categoryId"]
    end

    def products
      API.get("categories/#{@category_id}")["products"].map {|x| Product.new(x) }
    end

    def self.find_by_id(id)
      all.select {|c| c.category_id == id }.first
    end

    def self.all
      result = API.get("categories")
      result.map { |params| Category.new(params) }
    end
  end
end
