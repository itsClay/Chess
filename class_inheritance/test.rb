class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss)
    super
    @employees = [] #each el is an Employee obj
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    total_salaries = 0
    @employees.each do |employee|
      total_salaries += employee.salary
    end
    total_salaries * multiplier
  end
end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new('Ned', 'Founder', 1_000_000, nil)
  darren = Manager.new('Darren', 'TA Manager', 78_000, 'Ned')
  shawna = Employee.new('Shawna', 'TA', 12_000, 'Darren')
  david = Employee.new('David', 'TA', 10_000, 'Darren')

  ned.add_employee(darren)
  ned.add_employee(shawna)
  ned.add_employee(david)

  darren.add_employee(shawna)
  darren.add_employee(david)

  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
end
