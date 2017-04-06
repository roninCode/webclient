class Employee
  attr_accessor :name, :age, :hobbies

  def initialize(input_options)
    @name = input_options['name']
    @age = input_options['age']
    @hobbies = input_options['hobbies'] 
  end

  def self.all
    employees = Unirest.get("#{ENV['API_BASE_URL']}/people/").body
    all_employees = []
    employees.each do |employee|
      all_employees << Employee.new(employee)
    end
    return all_employees
  end

  def self.find(the_id)
    employee = Unirest.get("#{ENV['API_BASE_URL']}/people/#{the_id}").body
    console
    return Employee.new(employee)
  end

end