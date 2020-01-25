require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do

  let!(:movie_one) { create(:batman_one) }

  let!(:movie_two) { create(:batman_two) }

  let!(:movie_three) { create(:batman_three) }

  context 'when call index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'return all and ordered by creation' do
      get :index
      expect(json.count).to eq(3)
      expect(compare_dates(json.first, json.second)).to eq(true)
      expect(compare_dates(json.first, json.third)).to  eq(true)
      expect(compare_dates(json.second, json.third)).to eq(true)
    end
  end

  private

  def json
    JSON.parse(response.body)
  end

  def compare_dates(movie_one, movie_two)
    movie_one['created_at'].to_time < movie_two['created_at'].to_time
  end

end
