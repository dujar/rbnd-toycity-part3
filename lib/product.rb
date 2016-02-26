
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
            if product_titles.include? @title
                raise DuplicateProductError, "'#{@title}' already exists!"
            else
                @@products << self
            end
    end


    def product_titles
            titles = []
            @@products.each do |item|
                titles << item.title
            end
           # @products.map{|product| product.title}
            #it does not work
    end

    def self.find_by_title selected_title
        @@products.each do |item|
           if item.title == selected_title
                found = item
                return found
            end
        end
    end

    def select_item item
        self.map{|i| i ==item}
    end

    def self.in_stock
        items = []
            @@products.each do |item|
                if item.stock > 0
                items << item
                
                end
            end
           #@@products.select{|product| item.in_stock?}
           #it does not work when implemented
       return items
    end

    def in_stock?
        stock > 0
    end

    def self.find number
        @@products[number-1]
    end




end

