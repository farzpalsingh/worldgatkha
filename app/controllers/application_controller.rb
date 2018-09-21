class ApplicationController < ActionController::Base
	protect_from_forgery

  layout :admin_signin

  def admin_signin
    if devise_controller?
      "admin_signin"
    end
  end
	def after_sign_in_path_for(resource)
		admin_index_path
	end
end
