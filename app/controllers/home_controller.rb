class HomeController < ApplicationController
  before_action :authenticate_developer!

  def index
  end
end
