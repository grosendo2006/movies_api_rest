require 'rails_helper'

RSpec.describe Api::V1::SeasonsController, type: :controller do

  let!(:season_one) { create(:got_one) }

  let!(:season_two) { create(:got_two) }

  let!(:season_three) { create(:breaking_bad_one, :with_episodes) }

  context 'when call index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'return all season and ordered by creation' do
      get :index
      expect(json.count).to eq(3)
      expect(compare_dates(json.first,  json.second)).to eq(true)
      expect(compare_dates(json.second, json.third)).to  eq(true)
    end

    it 'return all episodes ordered by number' do
      get :index
      ordered = check_episode_order(json.third['episodes'])
      expect(json.first['episodes'].count).to  eq(0)
      expect(json.second['episodes'].count).to eq(0)
      expect(json.third['episodes'].count).to  eq(11)
      expect(ordered).to                       eq(true)
    end
  end

  private

  def json
    JSON.parse(response.body)
  end

  def compare_dates(movie_one, movie_two)
    movie_one['created_at'].to_time < movie_two['created_at'].to_time
  end

  def check_episode_order(episodes)
    min = -999
    result = true
    episodes.map { |episode|
      episode['number'] > min ? min = episode['number'] : result = false
    }
    result
  end

end
