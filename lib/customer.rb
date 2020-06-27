class Customer
    attr_accessor :name, :age
    @@all = []
    def initialize(name, age)
        @name = name 
        @age = age
        @@all << self
    end
    def self.all
        @@all
    end
    def new_meal(waiter, total, tip = 0)
        Meal.new(waiter, self, total, tip)
    end  
    def meals 
       Meal.all.select{|dinning| dinning.customer == self}
    end  
    def waiters
        waiter = []
        meals.each do |meals|
        waiter << meals.waiter
        end
        waiter
    end       
end