
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
            if product_titles.include? @title
                raise DuplicateProductError, "'#{@title}' already exists!"
            else
                @@products << self
            end
        end
    end

    def product_titles
        titles = []
            @@products.each do |item|
                titles << item.title
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
        items = []
            @@products.each do |item|
                if item.stock > 0
                items << item
                end
            end
        return items
    end

    def in_stock?
        if stock > 0
            true
        else
            false
        end
    end




end

