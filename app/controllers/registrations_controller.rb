class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    def create
      super do |user|
        if request.format.json?
          data = {
            token: user.authentication_token,
            email: user.email
          }
          render json: data, status: 201 and return
        end
      end
    end
end
  