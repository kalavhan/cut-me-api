class AppointmentsController < ApplicationController
  def add
    @appointment = Appointment.create!(appointment_params)
    json_response(@appointment, :created)
  end

  def show
    @appointment = User.eager_load(:appointments => :barber).find_by!(id: params[:id])
    render json: @appointment, :include => {:appointments => {:include => {:barber => {:only =>[:name, :last_name, :id]}}, :only => [:id, :appt_date]}}, :only => [:id]
  end

  private

  def appointment_params
    params.permit(:appt_date, :appt_time, :user_id, :barber_id)
  end

end
