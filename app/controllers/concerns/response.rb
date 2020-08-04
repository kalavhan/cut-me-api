module Response
  def json_response(object, include = nil, only = nil, status = :ok)
    render json: object, include: include, only: only, status: status
  end
end
