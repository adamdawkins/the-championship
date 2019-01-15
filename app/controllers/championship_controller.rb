class ChampionshipController < ApplicationController
  def index
    @live_task = Task.find_by(is_live: true)
  end
end
