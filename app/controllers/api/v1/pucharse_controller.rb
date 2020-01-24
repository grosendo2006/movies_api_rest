module Api
  module V1
    class PucharseController < ApplicationController

      skip_before_action :verify_authenticity_token
      before_action :set_user
      before_action :set_purchase_option

      def create
        if @purchase_option && @user
          if (@user.in_library?(@purchase_option))
            'no puede volver a comprar'
          else
            @user.purchases << Purchase.create(purchase_option: @purchase_option.content)
            'compra con exito'
          end
        else
          'Invalid user_id or purchase_option_id'
        end
      end

      private

      def pucharse_params
        params.permit(:user_id, :purchase_option_id)
      end

      def set_user
        @user = User.find(pucharse_params[:user_id])
      end

      def set_purchase_option
        @purchase_option = PurchaseOption.find(pucharse_params[:purchase_option_id])
      end
    end
  end
end