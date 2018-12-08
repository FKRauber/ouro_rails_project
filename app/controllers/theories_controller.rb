class TheoriesController < ApplicationController
  before_action :theory, except: [:new, :create, :index]
  
  def index
    @theories = Theory.all
  end

  def show
    @theory = theory
  end

  def new
    @theory = Theory.new
  end
  def create
    @theory = Theory.create(theory_params)
    if @theory.save
      redirect_to threasure_theories_path, notice: "Theory was successfully saved"
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @theory.update(theory_params)
      redirect_to @theory, notice: "Theory was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @theory.destroy
    redirect_to theories_url, notice: "Theory was successfully destroyed"
  end

  private

  def theory
    @theory = Theory.find(params[:id])
  end

  def theory_params
    params.require(:theory).permit(:name, :description, :issues, :success, :prove_date)
  end
end
