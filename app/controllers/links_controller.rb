require 'open-uri'

class LinksController < ApplicationController

  # GET /links
  def index
    @links = Link.all
    render :json => @links, include: { headers: {only: [:tag, :content]} }
  end

  def create
    @link = Link.new(url: params[:url])
    if @link.save
      parsed_body = Nokogiri::HTML(open(params['url']))

      parsed_body.css('h1', 'h2', 'h3').each do |element|
        new_header = Header.new(content: element.text, tag: element.name)
        new_header.link = @link
        new_header.save
      end

      render :json => @link, include: { headers: {only: [:tag, :content]} }, status: 201
    else
      render :json => {:errors => @link.errors.full_messages}, status: 422
    end
  end

end
