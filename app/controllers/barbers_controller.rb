class BarbersController < ApplicationController
  def index
    @barber = Barber.all
    json_response(@barber)
  end

  def show
    @barber = Barber.where("id = ?", params[:id]).eager_load(:services)
    json_response(@barber)
  end
end
