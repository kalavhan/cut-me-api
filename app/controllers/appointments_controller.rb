class AppointmentsController < ApplicationController
  def add
    @appointment = Appointment.create!(appointment_params)
    json_response(@appointment, :created)
  end

  def show
    @appointment = Appointment.eager_load(:barber).find_by!(user_id: params[:id])
    render json: @appointment, :include => [:barber => { :only => [:name, :last_name, :id]}]
  end

  private

  def appointment_params
    params.permit(:appt_date, :appt_time, :user_id, :barber_id)
  end

end
