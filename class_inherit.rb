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

    attr_reader :name
    protected
    attr_accessor :title, :salary, :boss
end

class Manager < Employee

    def initialize(name, title, salary, boss = nil)

        super(name, title, salary, boss)

        self.employees = []

    end

    def add_employee(employee)
        self.employees << employee
    end

    def bonus(multi)
        total_subsalary = 0
        employees.each do |employee|
            total_subsalary += employee.salary
        end

        total_subsalary * multi
    end

    # protected
    attr_accessor :employees, :name, :title, :salary, :boss
end