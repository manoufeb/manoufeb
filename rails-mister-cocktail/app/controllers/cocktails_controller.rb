class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show ]
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @dose = @cocktail.doses.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      @cocktail.doses.create(dose_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture, :photo)
  end

  def dose_params
    params.require(:cocktail).require(:dose).permit(:description, :ingredient_id)
  end

end
