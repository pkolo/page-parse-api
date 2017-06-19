require 'rails_helper'

RSpec.describe 'Links API', type: :request do
  # initialize test data
  let!(:links) { create_list(:link, 10) }

  # Test suite for GET /links
  describe 'GET /links' do
    # make HTTP get request before each example
    before { get '/links' }

    it 'returns links' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    # Tests JSON formatting
    it 'returns an array of objects with id and url' do
      json = JSON.parse(response.body)
      expect(json.first['id']).not_to be(nil)
      expect(json.first['url']).not_to be(nil)
    end
  end

end
