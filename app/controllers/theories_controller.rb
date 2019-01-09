class TheoriesController < ApplicationController

  def new
    @theory = Theory.new
    @treasure = Treasure.find_by(id: params[:treasure_id])
  end
  def create
    @treasure = Treasure.find_by(id: params[:treasure_id])
    @theory = @treasure.theories.build(theory_params)
    
    if @theory.save
      redirect_to @treasure, notice: "Theory was successfully saved"
    else
      render :new
    end
  end

  def edit
    theory
  end
  def update
    theory.update(theory_params)
    if theory.save
      redirect_to @theory, notice: "Theory was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    theory.destroy
    redirect_to theories_path, notice: "Theory was successfully destroyed"
  end

  private

  def theory
    @theory = Theory.find(params[:id])
  end

  def theory_params
    params.require(:theory).permit(:name, :description, :issues, :success, :prove_date, :treasure_id)
  end
end
