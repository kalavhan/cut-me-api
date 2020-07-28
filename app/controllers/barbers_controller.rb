class BarbersController < ApplicationController
  def index
    @barber = Barber.all
    json_response(@barber)
  end

  def show
    @barber = Barber.includes(:services).find_by!(id: params[:id])
    json_response(@barber)
  end
end
