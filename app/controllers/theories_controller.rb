class TheoriesController < ApplicationController

  def new
    treasure
    @theory = Theory.new
    # @treasure.theory << @theory
  end
  def create
    treasure
    @theory = @treasure.theories.build(theory_params)

    if @theory.save
      redirect_to @treasure, notice: "Theory was successfully saved"
    else
      render :new
    end
  end

  def edit
    theory
    treasure
  end
  def update
    treasure
    theory.update(theory_params)
    if theory.save
      redirect_to treasure_path, notice: "Theory was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    treasure
    theory.destroy
    redirect_to treasure_path, notice: "Theory was successfully destroyed"
  end


  def recent
    @theories = Theory.recent_theories
  end

  private

  def theory
    @theory = Theory.find_by(id: params[:id])
  end

  def treasure
    @treasure = Treasure.find_by(id: params[:treasure_id])
  end

  def theory_params
    params.require(:theory).permit(:name, :description, :issues, :success, :prove_date, :treasure_id)
  end
end
