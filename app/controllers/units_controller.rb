class UnitsController < ApplicationController

  def new
    @unit = Unit.new
  end

  def show
    @unit = Unit.find(params[:id])
    @tenants = Tenant.where(unit_id: params[:id])
  end

  def index
    @units = Unit.all.sort{|a,b| [a.sector.property.name, a.sector.name, a.name] <=> [b.sector.property.name, b.sector.name, b.name]}
  end

  def edit
    @unit = Unit.find(params[:id])
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
      flash[:notice] = "Account Updated"
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

  def unit_params
    params.require(:unit).permit(:name, :sector_id)
  end

end
