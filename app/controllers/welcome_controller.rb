class WelcomeController < ApplicationController
  include Fie::Manipulator
  def index
    @settings = Settings.all
    console
  end
end
