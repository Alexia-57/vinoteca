class WinesController < ApplicationController
 #new method is in pages controller, since the form is on homepage

  def create
    @wine = Wine.new(wine_params)
    @wine.user = current_user

    if @wine.save
      flash[:notice] = 'Votre vin a été ajouté.'
      redirect_to wine_path(@wine)
    else
      flash[:alert] = 'un problème est survenu.'
      # render :new
      redirect_to new_wine_path
    end
  end

  def index
    @user = current_user
    @wines = @user.wines

    if params[:query].present?
      @wines = Wine.search_by_details(params[:query])
    else
      # @wines = Wine.all
      # order(created_at: :desc) is to display most recent first
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
