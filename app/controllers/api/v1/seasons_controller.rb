module Api
  module V1
    class SeasonsController < ApplicationController
      def index
        render json: Season.all.order(:created_at).to_json(include: :episodes)
      end
    end
  end
end