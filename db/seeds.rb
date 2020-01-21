# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'
require 'pry'

playerUrl = 'http://data.nba.net/data/10s/prod/v1/2019/players.json'
teamUrl = 'http://data.nba.net/data/10s/prod/v1/2019/teams.json'

playerResponse = RestClient.get(playerUrl)
playerData = JSON.parse(playerResponse)

teamResponse = RestClient.get(teamUrl)
teamData = JSON.parse(teamResponse)

activePlayers = playerData['league']['standard'].each do |player|
    if player['isActive']
        
        team = teamData['league']['standard'].find{|el| el['teamId'] == player['teams'].last['teamId']}

        playerHash =  {
            'name' => player['firstName'] + " " + player['lastName'],
            'team' => team['city'] + " " + team['nickname'],
            'position' => player['pos']
        }

        Player.create(playerHash)
    end
end
