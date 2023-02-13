class StaticPagesController < ApplicationController
  def index
    @all_gossips = Gossip.order(id: :asc)
  end
end
