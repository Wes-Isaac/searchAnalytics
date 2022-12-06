require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /search' do
    before(:example) { get '/search'}
    

    it 'should return http 200 success' do
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end

  end
end