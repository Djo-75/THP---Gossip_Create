class GossipsController < ApplicationController
   before_action :authenticate_user
   include GossipsHelper
  
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
        @user = current_user
        @gossip = Gossip.new('title' => params[:title],
                             'content' => params[:content], 'user_id' => @user.id)
        if @gossip.save
          redirect_to gossips_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
    @gossip = Gossip.find(params[:id]) #
      if verify_user?
        render :edit
      else
        redirect_to gossips_path
      end
    end
    
    def update
      @gossip = Gossip.find(params[:id])
      if verify_user? && @gossip.update(title: params[:title], content: params[:content])
        redirect_to gossips_path
      else
        render :edit
      end
    end

    def destroy
      if verify_user?
       @gossip = Gossip.find(params[:id])
       @gossip.destroy
       redirect_to root_path, notice: "Le potin a été supprimé avec succès"
      else
        redirect_to gossips_path, notice: "Tu dois être connecté"
      end
    end

    private

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
end
