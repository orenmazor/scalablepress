module Scalablepress
  class Category
    attr_reader :name

    def initialize(params)
      puts params
      @name = params["name"]
    end

    def products
      API.get("categories/#{@name}")
    end

    def self.all
      result = API.get("categories")
      result.map { |params| Category.new(params) }
    end
  end
end
