class RegistrationsController < Devise::RegistrationsController
	after_action :check_location



  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :address)
  end

  def check_location
  	if(user_signed_in?)
  	user_id = current_user.try(:id)
		user = User.find(user_id)
		 if(user.location == nil)
		    @location = Location.create(:address => user.address)
		    user.location = @location
		    user.save
		 elsif(user.location.address != user.address)
		 	user.location.destroy
		 	@location = Location.create(:address => user.address)
		 	user.location = @location
		 	user.save
		 end
	end
  end
end