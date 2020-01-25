require 'rails_helper'

RSpec.describe 'Api::V1::Purchase::Create' do

  let!(:purchase_option_one) { create(:purchase_option_one, :with_movie) }
  let!(:purchase_option_two) { create(:purchase_option_two, :with_season) }
  let!(:user) { create(:user_one) }

  context 'when params are valids' do
    it 'does update contact' do
      byebug
    end
  end
end
