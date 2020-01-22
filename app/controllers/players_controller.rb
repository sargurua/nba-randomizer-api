class PlayersController < ApplicationController
    
    def index    
        render :json => Player.all.as_json(only: [:name, :position, :team])
    end

    def random
        render :json => Player.all.first.as_json
    end

end
