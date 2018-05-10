class SectorsController < ApplicationController
  before_action :fetch_sector, only: [:edit, :update, :show, :destroy, :property]
  def new
    @sector = Sector.new()
  end

  def create
    @sector = Sector.create(sector_params)
    if @sector.valid?
      redirect_to @sector
    else
      flash[:errors] = @sector.errors.full_messages
      redirect_to new_sector_path
    end
  end

  def show
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end
    @units = Unit.where(sector_id: params[:id])
  end

  def index
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end
    @sectors = Sector.all.group_by{|sector| sector.property.name}.sort_by{|prop_name, sector| prop_name}
    #byebug
    #.sort{|a,b| a[]}
    #.sort_by{|prop_name, sector| prop_name}
  end

  def edit
    @sector = Sector.find(params[:id])
    @properties = Property.all#where(property_id: params[:id])
  end

  def update
    @sector.update(sector_params)
    if @sector.valid?
      redirect_to @sector
    else
      flash[:errors] = @sector.errors.full_messages
      redirect_to edit_sector_path(@sector)
    end
  end

  def destroy
    @sector.destroy
    redirect_to sectors_path
  end

  private

  def sector_params
    params.require(:sector).permit(:name, :unit_id)
  end

  def fetch_sector
    @sector = Sector.find(params[:id])
  end

end
