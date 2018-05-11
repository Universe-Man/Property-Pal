class UnitsController < ApplicationController
before_action :is_logged_in?
before_action :fetch_unit, only: [:update, :edit, :show, :destroy]


  def new
    @unit = Unit.new
  end

  def show
    @unit = Unit.find(params[:id])
    if is_logged_in? #!= false
      @tenants = Tenant.where(unit_id: params[:id])
    end
  end

  def index

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
    @unit = Unit.find(params[:id])
    @unit.update(unit_params)
    if @unit.valid?
      flash[:notice] = "Unit Updated"
      redirect_to @unit
    else
      flash[:errors] = @unit.errors.full_messages
      redirect_to edit_unit_path(@unit)
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    flash[:notice] = "Unit Deleted"
    redirect_to admin_dashboard_path
  end

  private

  def is_logged_in?
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    else
      false
    end
  end


  def unit_params
    params.require(:unit).permit(:name, :sector_id)
  end

  def fetch_unit
    @unit = Unit.find(params[:id])
  end




end
