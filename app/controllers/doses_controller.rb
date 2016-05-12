class DosesController < ApplicationController

  def new
    @ingredients = Ingredient.all
    @cocktail = find_cocktail
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = params[:cocktail_id]
    @dose.save
    redirect_to cocktail_path(find_cocktail)
  end

  def destroy
    @cocktail = find_cocktail
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    Cocktail.find(params[:cocktail_id])
  end

end



