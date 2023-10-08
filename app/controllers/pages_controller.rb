class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @wine = Wine.new
  end
end
