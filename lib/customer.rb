class Customer

    attr_accessor :name, :age, :nationality


    @@customers = []
    @@id = 0
    def initialize options = {}
        @id = @@id
        @@id += 1
        @name = options[:name]
        @age = options[:age]
        @nationality = options[:nationality]
        if @id > 1
            if @@customers.name? @name
                raise  DuplicateCustomerError, "#{@name} already exists!"
            end
        else
        @@customers << self
        end
    end
    def self.name? selected_name
        @@customers.each do |item|
           if item.name == selected_name
                return false
           else
               return true
            end
        end
    end



    def self.find_by_name search
        @@customers.each do |item|
            if item.name == search
                found = item
                return found
            end
        end
    end
    def self.all
        @@customers
    end

    def purchase product, options ={}
        Transaction.new(self,product,options = {})
    end

    def self.find number
        @@customer[number-1]
    end
end
