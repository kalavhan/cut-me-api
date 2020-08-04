module Response
  def json_response(object, include = nil, only = nil, status = :ok)
    render json: object, include: include, status: status
  end
end
