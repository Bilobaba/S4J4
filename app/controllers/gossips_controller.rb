class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all?
  end

  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def create
    @gossip = Gossip.new(params_gossip)
    if @gossip.save
      redirect_to gossip_path(@moussaillon)
    else
      redirect_to new_gossip_path
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(params_gossip)
  end


  private
    def params_gossip
      params.require(:gossip).permit(:body, :moussaillon)
    end
end
