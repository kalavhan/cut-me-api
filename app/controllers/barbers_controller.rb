class BarbersController < ApplicationController
  def index
    @barber = Barber.all
    json_response(@barber)
  end

  def show
    @barber = Barber.find_by!(id: params[:id])
    if (@barber)
      @barber = @barber.services
    end
    json_response(@barber)
  end
end
