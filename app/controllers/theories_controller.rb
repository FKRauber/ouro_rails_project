class TheoriesController < ApplicationController
  def index
    if params[:treasure_id]
      @treasure = Treasure.find_by(id: params[:treasure_id])
      if @treasure == nil
        flash[:alert] = "Treasure Not Found."
        redirect_to treasure_path
      else
        @theories = @treasure.theories
      end
    else
      @theories = Theory.all
    end
  end

  def show
    if params[:treasure_id]
      @treasure = Treasure.find_by(id: params[:treasure_id])
      @theory = @treasure.theories.find_by(id: params[:id])
      if @theory == nil
        flash[:alert] = "Theory Not Found."
        redirect_to treasure_theories_path(@treasure)
      end
    else
      theory
    end
  end

  def new
    @theory = Theory.new
    @treasure = Treasure.find_by(params[:id])
  end
  def create
    @theory = Theory.new(theory_params)
    if @theory.save
      redirect_to @theory, notice: "Theory was successfully saved"
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
    params.require(:theory).permit(:name, :description, :issues, :success, :prove_date)
  end
end
