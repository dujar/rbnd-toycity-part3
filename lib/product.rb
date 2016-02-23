
class Product

    attr_reader :title, :price, :stock

    @@products= []
    @@id = 1
    def initialize options = {}
        @id = @@id
        @@id += 1
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        @@products << self
    end

    def self.all
        @@products
    end

end
