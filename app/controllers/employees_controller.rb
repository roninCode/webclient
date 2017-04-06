class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render 'index.html.erb' 
  end

  def show 
    @employee = Employee.find(params['id'])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    employee = Unirest.post("#{ENV['API_BASE_URL']}/people",
      headers:{ "Accept" => "application/json" }, 
      parameters:{ name: params['name'], age: params['age'], hobbies: params['hobbies'] }).body

    redirect_to '/employees'
  end
 
  def edit
    @employee = Employee.find(params['id'])
    render 'edit.html.erb'
  end

  def update
    employee = Unirest.patch("#{ENV['API_BASE_URL']}/people/#{params[:id]}", headers: {"Accept" => "application/json" }, 
      parameters:{ name: params['name'],
        age: params['age'],
        hobbies: params['hobbies']}
    ).body
    redirect_to '/employees'
  end

  def destroy
    employee = Unirest.delete("#{ENV['API_BASE_URL']}/people/#{params[:id]}", 
      headers: {"Accept" => "application/json" }).body
    redirect_to '/employees'
  end

end
