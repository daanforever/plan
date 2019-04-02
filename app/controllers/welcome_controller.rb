class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to :tasks
    else
      @message = 'Hello'
    end
  end
end
