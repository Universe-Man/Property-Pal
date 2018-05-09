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
    @units = Unit.where(sector_id: params[:id])
  end

  def index
    @sectors = Sector.all
  end

  def edit
    @sector = Sector.find(params[:id])
    byebug
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
