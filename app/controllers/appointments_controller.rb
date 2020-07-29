class AppointmentsController < ApplicationController
  def add
    @appointment = Appointment.create!(user_params)
    json_response(@appointment, :created)
  end

  private

  def appointment_params
    params.permit(:appt_date, :appt_time, :user_id, :barber_id)
  end

end
