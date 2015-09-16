class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
      flash[:notice] = "#{@team.name} was successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @team.update_attributes(team_params)
      flash[:success] = "Team info updated!"
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    name = @team.name
    @team.destroy
    flash[:success] = "#{name} was deleted!"
    redirect_to teams_path
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :sport)
  end
end
