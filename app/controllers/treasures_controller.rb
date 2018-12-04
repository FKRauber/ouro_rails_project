require 'pry'

class TreasuresController < ApplicationController
  before_action :treasure, except: [:new, :create, :index]
  
  def index
    @treasures = Treasure.all
  end

  def show
    @treasure = treasure
  end

  def new
    @treasure = Treasure.new
  end
  def create
    @treasure = Treasure.new(treasure_params)
 binding.pry
    if @treasure.save
     
      redirect_to @treasure, notice: "Treasure was successfully saved"
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @treasure.update(treasure_params)
      redirect_to @treasure, notice: "Treasure was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @treasure.destroy
    redirect_to treasures_url, notice: "Treasure was successfully destroyed"
  end

  private

  def treasure
    @treasure = Treasure.find(params[:id])
  end

  def treasure_params
    params.require(:treasure).permit(:name, :description)
  end
end
