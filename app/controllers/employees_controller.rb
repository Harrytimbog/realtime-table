class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  def index
    @employees = Employee.all
    @employee = Employee.new
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: "Employee was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy
    redirect_to employees_url, notice: "Employee was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:name, :position, :office, :extension, :start_date)
  end
end
