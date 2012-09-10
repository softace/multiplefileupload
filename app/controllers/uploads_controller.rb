class UploadsController < ApplicationController
  # GET /uploads/new
  def new
    @upload_params = params && params[:upload]
    @upload = Upload.new(@upload_params)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

end
