
def gchart
  Gchart.pie(:data => Unit.all, :title => Vacancy, :size => '400x200')
end

class AdminsController < ApplicationController

  before_action :fetch_admin, only: [:show, :edit, :update, :destroy]


  def new
    @admin = Admin.new
  end

  def show
    @admin = Admin.find(params[:id])
    # @properties = Property.all
  end


  def admin_login
  end

  def new
    @admin = Admin.new
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

  def show
  end

  def index
    @admins = Admin.all
  end

  def edit
  end

  def update
    @admin.update(admin_params)
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

  def dashboard
    #Admin MUST BE LOGGED IN for this to work
    if session[:admin_id]
      @admin = Admin.find(session[:admin_id])
      @properties = Property.where(admin_id: @admin.id)
      @sectors = @properties.map{|prop| prop.sectors}.flatten
      @units = @sectors.map{|sect| sect.units}.flatten
      @tenants = @units.map{|unit| unit.tenants}.flatten
    else
      flash[:error] = "You must be logged in to view the dashboard."
      redirect_to login_path
    end
  end

  def redir_from_dash
    if params.include?(:unit)
      @unit = Unit.find(params[:unit][:unit_id])
      redirect_to unit_path(@unit)
    elsif params.include?(:sector)
      @sector = Sector.find(params[:sector][:sector_id])
      redirect_to sector_path(@sector)
    elsif params.include?(:property)
      @property = Property.find(params[:property][:property_id])
      redirect_to property_path(@property)
    else
      redirect_to admin_dashboard_path
    end
  end

  def retrieve_info
    #byebug
  end

  private

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :hint_password, :address_id, :contract_id, :property_id)
  end

  def fetch_admin
    @admin = Admin.find(params[:id])
  end

end
