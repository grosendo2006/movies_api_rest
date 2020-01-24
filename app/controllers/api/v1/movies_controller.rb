module Api
  module V1
    class MoviesController < ApplicationController
      def index
        render json: Movie.all.order(:created_at)
      end
    end
  end
end