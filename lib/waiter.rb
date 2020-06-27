class Waiter
    attr_reader :name, :year
    @@all = []
    def initialize(name, year)
        @name = name
        @year = year
        @@all << self 
    end    
    def self.all
        @@all
    end
    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end    
    def meals
        Meal.all.select{|dinning| dinning.waiter == self}
    end
    def best_tipper
        best_tip = Meal.all.max_by{|tip| tip.tip}
        best_tip.customer
    end        
end