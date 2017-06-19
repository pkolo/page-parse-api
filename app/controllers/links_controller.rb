class LinksController < ApplicationController

  # GET /links
  def index
    @links = Link.all
    render json: @links
  end

end
