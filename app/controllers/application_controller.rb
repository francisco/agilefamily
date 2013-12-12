class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if current_family_member.family_id
      family_path(current_family_member.family_id)
    else
      new_family_path
    end
  end

end
