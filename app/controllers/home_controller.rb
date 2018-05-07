class HomeController < ApplicationController
  before_action :authenticate_user

  def index
    render template: 'home'
  end
end
