class Admin::ContestantsController < AdminsController
  before_action :set_term, except: :index
  before_action :set_contestant, only: :update
  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = @term.contestants.build(contestant_params)
    if @contestant.save
      redirect_to admin_contestants_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @contestant.update(contestant_params)
        format.html { redirect_to admin_contestants_path, notice: 'Contestant was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def index
    @contestants = Contestant.all
  end

  private

    def set_term
      @term = Term.first
    end

    def set_contestant
      @contestant = Contestant.find(params[:id])
    end

    def contestant_params
      params.require(:contestant).permit(:name, :team_id)
    end
end
