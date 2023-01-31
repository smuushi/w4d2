class Employee

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss

    end

    def bonus(multi)
        self.salary * multi
    end

    protected
    attr_accessor :title, :salary, :boss, :name

end

class Manager < Employee

    def initialize(name, title, salary, boss = nil)

        super(name, title, salary, boss)

        self.employees = []

    end

    protected
    attr_accessor :employees, :name, :title, :salary, :boss
    
end