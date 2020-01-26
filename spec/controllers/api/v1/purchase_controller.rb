require 'rails_helper'

RSpec.describe Api::V1::PurchaseController, type: :controller do

  let!(:user) { create(:user_with_purchases) }

  context 'when call index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index, { params: { user_id:  user.id } }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'return user with library' do
      get :index, { params: { user_id:  user.id } }
      expect(user.purchases.count).to eq(4)
      expect(json.count).to           eq(user.library.count)
      expect(json.count).to           eq(3)
    end
  end

  private

  def json
    JSON.parse(response.body)
  end

end
