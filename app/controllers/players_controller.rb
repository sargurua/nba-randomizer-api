class PlayersController < ApplicationController
    
    def index    
        render :json => Player.all.as_json(only: [:name, :position, :team, :player_ref, :team_ref])
    end

    def random
        p params

        returnPlayers = []
        playerPool = Player.all.to_a

        for i in 0..params[:num_players].to_i - 1 do   
            returnPlayers << playerPool.delete(playerPool.sample)
        end

        render :json => returnPlayers.as_json(only: [:name, :position, :team, :player_ref, :team_ref])
    end

end
