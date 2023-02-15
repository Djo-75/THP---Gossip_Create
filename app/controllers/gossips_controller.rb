class GossipsController < ApplicationController
    
    def index
      @all_gossips = Gossip.all
    end


    def show
      @gossip_id = Gossip.find(params[:id])
    end
    
    def new
        @gossip = Gossip.new('title' => params[:title],
        'content' => params[:content])
    end

    def create
        @gossip = Gossip.new('title' => params[:title],
                             'content' => params[:content])

        if @gossip.save
          redirect_to gossips_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
      @gossip = Gossip.find(params[:id])
    end
    
    def update
      @gossip = Gossip.find(params[:id])
      if @gossip.update('title' => params[:title],
        'content' => params[:content])
        redirect_to @gossip
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    
    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
  
      redirect_to root_path, notice: "Le potin a été supprimé avec succès"
    end
end
