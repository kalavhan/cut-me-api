class AppointmentsController < ApplicationController
  def add
    @appointment = Appointment.create!(appointment_params)
    json_response(@appointment, nil, nil, :created)
  end

  def show
    @appointment = User.eager_load(appointments: :barber).find_by!(id: params[:id])
    json_response(@appointment, {
      appointments: {
        include: { barber: { only: %i[name last_name id] } },
        only: %i[id appt_date]
      }
    }, [:id])
  end

  private

  def appointment_params
    params.permit(:appt_date, :user_id, :barber_id)
  end
end
