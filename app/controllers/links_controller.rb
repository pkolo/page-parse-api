class LinksController < ApplicationController

  # GET /links
  def index
    @links = Link.all
    render :json => @links, include: { headers: {only: [:tag, :content]} }
  end

end
