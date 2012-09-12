class UploadsController < ApplicationController
  # GET /uploads/new
  def new

    user_agent = UserAgent.find_or_create_by_user_agent_string(request.env['HTTP_USER_AGENT'])
    case request.method
    when "GET" then user_agent.increment!(:get_count)
    when "POST" then nil
    end
    upload_params = params && params[:upload]
    @upload = Upload.new(upload_params)

    @request_body = nil
    if request.method == "POST"
      if request.body.size < 1000
        @request_body = request.body.read
      else
        @upload.errors.add(:files, "HTTP Request body too large (> 1000 bytes)")
      end
    end

    @utf8_enforcer_tag_enabled = false
    respond_to do |format|
      format.html # new.html.erb
    end
  end
end
