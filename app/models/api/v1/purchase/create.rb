module Api
  module V1
    module Purchase
      class Create
        def initialize(purchase_option, user)
          @purchase_option = purchase_option
          @user            = user
          @status          = 404
          @message         = "Couldn't find user or purchase option"
        end

        def call
          if @purchase_option && @user
            if (@user.in_library?(@purchase_option))
              @status  = 405
              @message = 'The user has already bought this option'
            else
              @user.purchases.create!(purchase_option: @purchase_option)
              @status  = :created
              @message = @user.errors.any? ? @user.errors.message : 'Success'
            end
          end
          response
        end

        private

        def response
          {
            message: @message,
            status:  @status
          }
        end
      end
    end
  end
end