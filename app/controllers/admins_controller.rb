class AdminsController < ApplicationController

  def new
    @admin = Admin.new()
  end

  def show
    @admin = Admin.find(params[:id])
    # @properties = Property.all
  end
  def admin_login
    @admin = Admin.new()

  end

  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.valid?
      redirect_to @admin
    else
      flash[:errors] = @admin.errors.full_messages
      redirect_to new_admin_path
    end
  end

  def update
    @admin = Admin.update(admin_params)
    if @admin.valid?
      redirect_to @admin
    else
      flash[:errors] = @admin.errors.full_messages
      redirect_to edit_admin_path(@admin)
    end
  end

  def destroy
    @admin.destroy
    redirect_to admins_path
  end

  private

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :hint_password, :address_id, :contract_id, :property_id)
  end

end
