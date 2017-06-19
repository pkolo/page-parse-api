class LinksController < ApplicationController

  # GET /links
  def index
    @links = Link.all
    render :json => @links, include: { headers: {only: [:tag, :content]} }
  end

  # POST /links
  def create
    @link = Link.new(url: params[:url])
    if @link.save
      render :json => @link, status: 201
    else
      render :json => {:errors => @link.errors.full_messages}, status: 422
    end
  end

end
