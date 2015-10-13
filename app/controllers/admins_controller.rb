class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find params[:id]
  end

  def edit
    @admin = Admin.find params[:id]
  end

  def update
    @admin = Admin.find params[:id]

    if @admin == current_user
      if @admin.update admin_params
        redirect_to @admin
      else
        render :edit
      end
    end
  end

  def new
    @admin = Admin.new
  end

  def destroy
    @admin = Admin.find params[:id]
    unless @admin == current_user || @admin.email == 'admin@ncsu.edu'
      @admin.destroy
    end
    redirect_to admins_path
  end

  def create
    @admin = Admin.new admin_params

    if @admin.save
      redirect_to @admin
    else
      render :new
    end
  end

  private
  def admin_params
    if current_user.admin? && current_user.email == 'admin@ncsu.edu'
      params.require(:admin).permit(:email, :name)
    else
      params.require(:admin).permit(:email, :name, :password, :password_confirmation)
    end
  end

end