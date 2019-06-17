class WelcomeController < ApplicationController
  include Fie::Manipulator
  def index
    console
  end
end
