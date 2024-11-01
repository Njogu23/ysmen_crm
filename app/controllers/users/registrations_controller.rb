# app/controllers/users/registrations_controller.rb
module Users
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :verify_authenticity_token

    def create
      build_resource(sign_up_params)
      resource.save
      if resource.persisted?
        render json: { user: resource, message: "Signed up successfully." }, status: :created
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end

  
    private

    def sign_up_params
      params.require(:user).permit(
        :email, :password, :password_confirmation, :role, :designation, :occupation,
        :firstname, :lastname, :nickname, :date_of_birth, :phone_number, :date_joined
      )
    end

    def account_update_params
      params.require(:user).permit(
        :email, :password, :password_confirmation, :current_password, :role, :designation, 
        :occupation, :firstname, :lastname, :nickname, :date_of_birth, :phone_number, :date_joined
      )
    end

  end
end
