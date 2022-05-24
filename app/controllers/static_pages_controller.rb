class StaticPagesController < ApplicationController
  require 'rest-client'
  require 'nokogiri'

  def index
    response = RestClient.get('https://www.flickr.com/services/rest/?method=flickr.people.getPhotos',
      { params: { user_id: search_params[:id], 
        api_key: ENV['flickr_api_key'], extras: 'url_m' }})

    doc = Nokogiri::XML(response)
    @photos = doc.xpath('//photo')
  end

  private

  def search_params
    params.permit(:id, :commit)
  end
end
