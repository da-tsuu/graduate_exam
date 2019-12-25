# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
	  redirect_to my_page_path, notice: 'プロフィールを更新しました'
    else
      render "profile_edit"
    end
  end
  
  protected
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  def configure_account_update_params
   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end


