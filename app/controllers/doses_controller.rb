class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  before_action :cocktail_params_id, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end

  def cocktail_params_id
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
