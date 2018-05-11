class UnitsController < ApplicationController
before_action :fetch_unit, only: [:update, :edit, :show, :destroy]
before_action :verify_tenant_or_admin

  def new
    @unit = Unit.new
  end

  def show
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end
    @unit = Unit.find(params[:id])
    @tenants = Tenant.where(unit_id: params[:id])
  end

  def index
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end
    @sectors = Sector.all.group_by{|sector| sector.property.name}
    @units = Unit.all.group_by{|unit| unit.sector.name}
  end

  def edit
  end

  def create
    @unit = Unit.create(unit_params)
    if @unit.valid?
      redirect_to @unit
    else
      flash[:errors] = @unit.errors.full_messages
      redirect_to new_unit_path
    end
  end

  def update
    @unit.update(unit_params)
    if @unit.valid?
      flash[:notice] = "Account Updated"
      redirect_to @unit
    else
      flash[:errors] = @unit.errors.full_messages
      redirect_to edit_unit_path(@unit)
    end
  end

  def destroy
    @unit.destroy
    redirect_to units_path
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :sector_id)
  end

  def fetch_unit
    @unit = Unit.find(params[:id])
  end

  
  def verify_tenant_or_admin
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end 
  end

end
