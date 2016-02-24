
class Product

    attr_accessor :title, :price, :stock

    @@products= []
    @@id = 1
    def initialize options = {}
        @id = @@id
        @@id += 1
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        add_to_products

    end

    def self.all
        @@products
    end

    def add_to_products
        if @@id > 1
            if initializers.include? @title
                raise DuplicateProductError, "'#{@title}' already exists!"
            else
        @@products << self
            end
        end
    end

    def initializers 
        titles = []
        prices = []
        stocks = []
            @@products.each do |item|
                titles << item.title
                prices << item.price
                stocks << item.stock
            end
        titles
    end


    def self.find_by_title selected_title
        @@products.each do |item|
            if item.title == selected_title
                found = item
                return found
            end

        end
    end

    def self.in_stock
        stocks = []
            @@products.each do |item|
                stocks << item.stock
            end
        return stocks
    end


    def in_stock?
        if stock > 0
            true
        else 
            false
        end
    end




end

