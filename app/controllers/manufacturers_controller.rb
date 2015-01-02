class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to root_path, notice: "Manufacturer successfully created!"
    else
      render :new
    end
  end

  protected

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country_name)
  end
end
