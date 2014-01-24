class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update]

  def index
    @games = Game.all
  end

  # Use new for route manipulation - create a game with a GET request
  def new
    @game = Game.create(game_params)
    redirect_to @game
  end

  def create
    Game.create(team_id: params[:team_id])
  end

  def show
    @players = @game.players_with_availability
  end

  def edit
    @players = @game.players_with_availability
  end

  def update
    @game.update_availability(params[:available])
    @game.update_attributes(game_params)
    redirect_to @game
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:team_id, :number_of_lineups)
    end
end
