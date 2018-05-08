class SectorsController < ApplicationController

  def new
    @sector = Sector.new()
  end

  def show
    byebug
    @sector = Sector.find(params[:id])
    @units = Unit.where(sector_id: params[:id])
  end

  def index
    @sectors = Sector.all
  end

  def edit
    @sector = Sector.find(params[:id])
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

  def update
    @sector = Sector.update(sector_params)
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

  # def find_property
  #   Property.all.map do |p|


end
