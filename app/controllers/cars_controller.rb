class CarsController < ApplicationController

  def index
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @cars = Car.all
  end

  def new
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car = Car.new
  end

  def create
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car = Car.new(car_params)
    @car.manufacturer_id = @manufacturer.id
    if @car.save
      redirect_to manufacturer_cars_path(@manufacturer.id), notice: "Car successfully created!"
    else
      render :new
    end
  end

  protected

  def car_params
    params.require(:car).permit(:mileage, :color, :year, :description)
  end
end
