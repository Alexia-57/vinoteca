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

  ## INITIAL INDEX
  # def index
  #   @user = current_user
  #   @wines = @user.wines

  #   if params[:query].present?
  #     @wines = @user.wines.search_by_details(params[:query]) # @wines = Wine.search_by_details(params[:query]) would search over all Wine model even from other users
  #   else
  #     @wines = @user.wines.order(created_at: :desc)
  #   end
  # end


  def index
    @user = current_user
    if params[:query].present?
      @wines = @user.wines.search_by_details(params[:query]).where(empty: false).order(year: :asc)
    else
      @wines = @user.wines.where(empty: false).order(year: :asc, created_at: :desc)
    end
  end

  ## INDEX TO DISPLAY ONLY NON-EMPTY WINES

  def empty_wines
    @user = current_user
    if params[:query].present?
      @empty_wines = @user.wines.search_by_details(params[:query]).where(empty: true).order(year: :asc)
    else
      @empty_wines = @user.wines.where(empty: true).order(year: :asc, created_at: :desc)
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
    params.require(:wine).permit(:name, :wine_type, :country, :region, :winery, :title, :year, :quantity, :rating, :empty, :comment)
  end

end
