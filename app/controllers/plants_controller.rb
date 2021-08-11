class PlantsController < ApplicationController
  def new
    @plant = Plant.new
    @park = Park.find(params[:park_id])
  end

  def create
    @park = Park.find(params[:park_id])
    @plant = Plant.new(plant_params)
    @plant.park = @park
    if @plant.save
      redirect_to park_path(@park)
    else
      render :new
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to park_path(params[:park_id])
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :img_url)
  end
end
