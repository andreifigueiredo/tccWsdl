class HomeController < ApplicationController
  before_action :authenticate_developer!

  def index
    redirect_to :controller => 'projects', :action => 'index'
  end
end
