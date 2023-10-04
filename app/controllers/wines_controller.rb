class WinesController < ApplicationController
  def index
    @user = current_user
    @wines = @user.wines

    if params[:query].present?
      @wines = Wine.search_by_details(params[:query])
    else
      # @wines = Wine.all
      # add .order(created_at: :desc) to display from most recent 1st = decending order based on created_at timetsamps
      @wines = current_user.wines.order(created_at: :desc)
    end
  end
end
