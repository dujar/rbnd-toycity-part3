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
        @@customers << self
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
end
