class ApplicationController < ActionController::Base
  before_action :update_cookie
  after_action :webconsole

  protected def after_sign_in_path_for(resource)
    tasks_path
  end

  private
    def update_cookie
      if user_signed_in?
        cookies.encrypted[:user_id] = current_user.id
      end
    end

    def webconsole
      console
    end
end
