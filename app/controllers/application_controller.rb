class ApplicationController < ActionController::Base
  before_action :update_cookie

  private
    def update_cookie
      cookies.encrypted[:user_id] = user_signed_in? ? current_user.id : nil
    end
end
