module Api
  module V1
    class PurchaseController < ApplicationController

      skip_before_action :verify_authenticity_token
      before_action :set_user
      before_action :set_purchase_option, only: :create

      def create
        response = Purchase::Create.new(@purchase_option, @user).call
        render json: response.except(:status), status: response[:status]
      end

      def index
        render json: @user.library
      end

      private

      def purchase_params
        params.permit(:user_id, :purchase_option_id)
      end

      def set_user
        @user = User.find(purchase_params[:user_id])
      end

      def set_purchase_option
        @purchase_option = PurchaseOption.find(purchase_params[:purchase_option_id])
      end
    end
  end
end