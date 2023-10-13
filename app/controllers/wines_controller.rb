class WinesController < ApplicationController
 #'new' method is in pages controller, since the form is on homepage

  def create
    @wine = Wine.new(wine_params)
    @wine.user = current_user

    if @wine.save
      flash[:popup_notice] = 'Votre vin a été ajouté'
      redirect_to wine_path(@wine)
    else
      flash[:alert] = 'Un problème est survenu'
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

  def edit
    @wine = Wine.find(params[:id])
    if @wine.user != current_user
      flash[:alert] = "Vous n'êtes pas authorisé à modifier ce vin"
      redirect_to wine_path(@wine)
    elsif @wine.errors.any?
      flash[:alert] = 'Il y a des erreurs dans les données du vin'
    end
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update(wine_params)
      flash[:popup_notice] = 'Modifications enregistrées'
      redirect_to wine_path(@wine)
    else
      flash[:alert] = 'Un problème est survenu'
      render :edit
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    if @wine.destroy
      flash[:wine_deleted] = "Votre vin a bien été supprimé"
    else
      flash[:wine_deletion_error] = "Une erreur s'est produite lors de la suppression du vin"
    end
    redirect_to wines_path, status: :see_other
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :wine_type, :country, :region, :winery, :variety, :year, :quantity, :rating, :empty, :comment)
  end

end
