class PlayersController < ApplicationController
    
    def index    
        render :json => Player.all.as_json(only: [:name, :position, :team])
    end

    def random
        returnPlayers = []
        playerPool = Player.all.to_a

        for i in 0..params[:num_players].to_i do   
            returnPlayers << playerPool.delete(playerPool.sample)
        end

        render :json => returnPlayers
    end

end
