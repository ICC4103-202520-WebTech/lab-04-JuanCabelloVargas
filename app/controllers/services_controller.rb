class ServicesController < ApplicationController
  def index
    @services = Service.All
  end

  def show
    @service = Service.find(params[:id])
  end
end
