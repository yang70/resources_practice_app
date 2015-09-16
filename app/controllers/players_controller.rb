class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: [:show, :destroy, :edit, :update]

  def index
    @players = @team.players.all
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = @team.players.build(player_params)
    if @player.save
      flash[:success] = "#{@player.name} was successfully added to the #{@team.name}"
      redirect_to team_player_path(@team, @player)
    else
      render 'new'
    end
  end

  def destroy
    name = @player.name
    @player.destroy
    flash[:success] = "#{name} was deleted!"
    redirect_to team_players_path(@team)
  end

  def edit
  end

  def update
    if @player.update_attributes(player_params)
      flash[:success] = "#{@player.name} info updated!"
      redirect_to team_player_path(@team, @player)
    else
      render 'edit'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :number, :position)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_player
    @player = @team.players.find(params[:id])
  end
end
