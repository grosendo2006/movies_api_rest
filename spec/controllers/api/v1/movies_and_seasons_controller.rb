require 'rails_helper'

RSpec.describe Api::V1::MoviesAndSeasonsController, type: :controller do

  let!(:movie_one) { create(:batman_one) }

  let!(:movie_two) { create(:batman_two) }

  let!(:movie_three) { create(:batman_three) }

  let!(:season_one) { create(:got_one) }

  let!(:season_two) { create(:got_two) }

  context 'when call index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'return all movies and seasons and ordered by creation' do
      get :index
      expect(json.count).to eq(5)
      expect(compare_dates(json.first,  json.second)).to eq(true)
      expect(compare_dates(json.second, json.third)).to  eq(true)
      expect(compare_dates(json.third,  json.fourth)).to eq(true)
      expect(compare_dates(json.fourth, json.fifth)).to  eq(true)
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
