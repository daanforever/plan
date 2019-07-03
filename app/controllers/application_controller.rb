class ApplicationController < ActionController::Base
  before_action :update_cookie

  private
    def update_cookie
      if user_signed_in?
        cookies.encrypted[:user_id] = current_user.id
      end
    end
end
