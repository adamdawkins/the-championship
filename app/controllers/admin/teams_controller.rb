class Admin::TeamsController < ApplicationController
  before_action :set_term, only: [:create]
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = @term.teams.build(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to admin_teams_path, notice: 'Team was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to admin_team_path(@team), notice: 'Team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to admin_teams_url, notice: 'Team was successfully destroyed.' }
    end
  end

  private
      def set_term
        @term = Term.first
      end
      def set_team
        @team = Team.find(params[:id])
      end

      def team_params
        params.require(:team).permit(:name)
      end
end
