require 'rails_helper'

RSpec.describe 'Api::V1::Purchase::Create' do

  let!(:purchase_option_one) { create(:purchase_option_one, :with_movie) }
  let!(:purchase_option_two) { create(:purchase_option_two, :with_season) }
  let!(:user) { create(:user_one) }

  context 'when params are valids' do
    let(:response) do
      Api::V1::Purchase::Create.new(purchase_option_one, user).call
    end
    it 'does create purchase' do
      expect(user.library.count).to eq(0)
      expect(response[:status]).to  eq(:created)
      expect(response[:message]).to eq('Success')
      expect(user.library.count).to eq(1)
    end
  end

  context 'when user already have purchase' do
    before do
      Api::V1::Purchase::Create.new(purchase_option_one, user).call
    end
    let(:response) do
      Api::V1::Purchase::Create.new(purchase_option_one, user).call
    end
    it 'does create purchase' do
      expect(response[:status]).to  eq(405)
      expect(response[:message]).to eq('The user has already bought this option')
      expect(user.library.count).to eq(1)
    end
  end

  context 'when params are invalids' do
    let(:response) do
      Api::V1::Purchase::Create.new(nil, nil).call
    end
    it 'does create purchase' do
      expect(response[:status]).to  eq(404)
      expect(response[:message]).to eq("Couldn't find user or purchase option")
    end
  end
end
