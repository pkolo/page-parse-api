require 'rails_helper'

RSpec.describe 'Links API', type: :request do
  # initialize test data
  let!(:link) { create(:link) }
  let!(:headers) { create_list(:header, 10, link_id: link.id) }

  # Test suite for GET /links
  describe 'GET /links' do
    # make HTTP get request before each example
    before { get '/links' }

    it 'returns links' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
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

    it 'link object includes array of headers' do
      json = JSON.parse(response.body)
      expect(json.first['headers']).not_to be(nil)
      expect(json.first['headers']).to be_an(Array)
    end

    it 'associated headers have content and tag' do
      json = JSON.parse(response.body)
      header = json.first['headers'].first
      expect(header['content']).not_to be(nil)
      expect(header['tag']).not_to be(nil)
    end
  end

  describe 'POST /links' do
    let(:valid_attributes) { {url: "http://www.example.com/"} }

    context 'when request is valid' do
      before { post '/links', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a link with url and id' do
        json = JSON.parse(response.body)
        expect(json['url']).to eq('http://www.example.com/')
      end

      it 'creates an array of associated headers for link' do
        json = JSON.parse(response.body)
        expect(json['headers']).not_to be(nil)
        expect(json['headers']).to be_an(Array)
      end

      it 'parses associated headers into content and tag' do
        json = JSON.parse(response.body)
        header = json['headers'].first
        expect(header['content']).to eq('Example Domain')
        expect(header['tag']).to eq('h1')
      end

    end

    context 'when request is empty' do
      before { post '/links' }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

    end

    context 'when request is invalid' do
      let(:invalid_attributes) { {url: 'example.com'} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

end
