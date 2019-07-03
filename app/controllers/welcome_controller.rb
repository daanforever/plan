class WelcomeController < ApplicationController
  include Fie::Manipulator
  def index
    @settings = Settings.all
    console if Rails.env.development?
  end
end
