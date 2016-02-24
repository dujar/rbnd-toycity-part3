class Transaction
    attr_accessor :quantity, :customer, :product, :id, :transaction, :discount

    @@transactions = []
    @@id = 1

    def initialize customer_name, product_name, options = {}
        @id = @@id
        @@id += 1
        @customer = customer_name
        @quantity = options[:quantity] || 1
        @discount = discount_product product_name
        @discount = @discount.round(2)
        @product = product_name
        if @product.stock == 0 || @product.stock <  @quantity
            raise OutOfStockError, "'#{@product.title}' is ouf of Stock!, there is #{@product.stock} in stock, and you are asking for #{@quantity}"
        else
        @product.stock = @product.stock - @quantity
        end
        @@transactions << self
    end

    def discount_product item
        if @quantity > 1
            discounted = item.price * 0.1
        else
            discounted = 0
        end
        return discounted
    end


    def self.all
        @@transactions
    end

    def self.find number
        @@transactions[number-1]
    end



end
