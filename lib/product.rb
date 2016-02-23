
class Product

    attr_reader :title, :price, :stock

    def initialize options = {}
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        @@product = {}
    end

    def self.all
        @product = {@title, @price, @stock}
    end

end
