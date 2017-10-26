class MoussaillonsController < ApplicationController

  def new
    @moussaillon = Moussaillon.new
  end

  def show
    @moussaillon = Moussaillon.find(params[:id])
  end

  def index
    @moussaillons = Moussaillon.all
  end


  def create
    @moussaillon = Moussaillon.new(params_moussaillon)
    if @moussaillon.save
      redirect_to moussaillon_path(@moussaillon)
    else
      redirect_to new_moussaillon_path
    end
  end

  def edit
    @moussaillon = Moussaillon.find(params[:id])
  end

  def update
    @moussaillon = Moussaillon.find(params[:id])

    if @moussaillon.update(mou)
      redirect_to @moussaillon
    else
      render 'edit'
    end
  end


  private

  def params_moussaillon
    params.require(:moussaillon).permit(:username,:email,:bio)
  end
end
