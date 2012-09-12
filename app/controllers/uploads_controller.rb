class UploadsController < ApplicationController
  # GET /uploads/new
  def new_get
    common

    @user_agent.increment!(:get_count)
    
    respond_to do |format|
      format.html { render 'new' } # new.html.erb
    end
  end

  # POST /uploads/new
  def new_post
    common
    
    upload_params = params && params[:upload]
    @upload = Upload.new(upload_params)

    if request.body.size < 1000
      @request_body = request.body.read
    else
      @upload.errors.add(:files, "HTTP Request body too large (> 1000 bytes)")
    end

    respond_to do |format|
      format.html { render 'new' } # new.html.erb
    end
  end

  def common
    @utf8_enforcer_tag_enabled = false
    @request_body = nil
    @user_agent = UserAgent.find_or_create_by_user_agent_string(request.env['HTTP_USER_AGENT'])
  end
end
