class WinesController < ApplicationController
  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.user = current_user

    if @wine.save
      flash[:notice] = 'Votre vin a été ajouté.'
      redirect_to @wine
    else
      render :new
    end
  end

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

  def show
    @wine = Wine.find(params[:id])
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :wine_type, :country, :region, :winery, :variety, :year, :quantity, :rating, :empty, :comment)
  end

end
