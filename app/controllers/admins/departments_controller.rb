class Admins::DepartmentsController < ApplicationController

  def index
    @department = Department.new
    @departments = Department.page(params[:page]).reverse_order.per(10)
  end

  def create
    @departments = Department.page(params[:page]).reverse_order
    @department = Department.new(department_params)
    if @department.save
      flash[:success] = "登録が完了しました"
      redirect_to admins_departments_path
    else
      render :index
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
       flash[:success] = "変更しました"
       redirect_to admins_departments_path
    else
      render :edit
    end
  end

  private

  def department_params
    params.permit(:name, :is_valid)
  end
end
