class App

  def call(env)
    request = Rack::Request.new(env)

    if request.path_info == '/time'
      @formatter = DateFormatter.new(request[:format])
      check_result
    else
      unknown_url(request.path_info)
    end
  end

  private

  def check_result
    if @formatter.result_success?
      time_response(@formatter)
    else
      unknown_format(@formatter.errors)
    end
  end

  def unknown_url(url)
    [404, { 'Content-Type' => 'text/plain' }, [" NOT FOUND"]]
  end

  def unknown_format(errors)
    [400, { 'Content-Type' => 'text/plain' }, ["UNKNOWN FORMAT"]]
  end

  def time_response(formatter)
    [200, { 'Content-Type' => 'text/plain' }, [formatter.result]]
  end
end
