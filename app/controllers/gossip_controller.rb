class GossipController < ApplicationController
    def gossip_section
        @array = []
        @id = params[:id]
        gossip_all = Gossip.order(id: :asc) # trie de l'index le plus petit au plus grand
        (gossip_all).each do |ligne| 
            @array << ligne
        end
    end
end
