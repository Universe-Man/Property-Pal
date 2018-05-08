class UnitsController < ApplicationController

  def new
    @unit = Unit.new()
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def index
    @units = Unit.all
    @tenants = Tenant.where(unit_id: params[:id])
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
    @unit = Unit.update(unit_params)
    if @unit.valid?
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
    params.require(:unit).permit(:name, :tenant_id)
  end

end
