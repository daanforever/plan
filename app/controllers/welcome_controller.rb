class WelcomeController < ApplicationController
  def index
    @settings = Settings.all
    console if Rails.env.development?
  end
end
