class UsersController < ApplicationController
  def upgrade
    @user = current_user
  end

  def change_role
    @user = current_user
 
    if @user.admin? == 'admin'
	  flash[:error] = "User is an admin. No update."
	elsif @user.standard?
	  go_premium
	  flash[:notice] = "User switched from standard to premium."
	else
	  to_standard
	  flash[:notice] = "User switched from premium to standard."
	end
	  redirect_to root_path
  end
 
  def go_premium
    @user = current_user
    @user.update_attribute(:role, 'premium')
  end
 
  def to_standard
  @user = current_user
	@user.update_attribute(:role, 'standard')
	redirect_to edit_user_registration_path
  end
end
