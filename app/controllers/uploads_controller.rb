class UploadsController < ApplicationController
  # GET /uploads/new
  def new
    upload_params = params && params[:upload]
    @upload = Upload.new(upload_params)

    if request.body.size < 1000
      @request_body = request.body.read
    else
      @upload.errors.add(:files, "HTTP Request body too large (> 1000 bytes)")
      @request_body = nil
    end
    respond_to do |format|
      format.html # new.html.erb
    end
  end

end
