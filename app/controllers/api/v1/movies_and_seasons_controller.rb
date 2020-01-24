module Api
  module V1
    class MoviesAndSeasonsController < ApplicationController
      def index
        render json: (Movie.all + Season.all).sort_by(&:created_at)
      end
    end
  end
end