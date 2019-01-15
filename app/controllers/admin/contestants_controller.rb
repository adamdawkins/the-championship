class Admin::ContestantsController < AdminsController
  before_action :set_term, except: :index
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

  def index
    @contestants = Contestant.all
  end

  private

    def set_term
      @term = Term.first
    end

    def contestant_params
      params.require(:contestant).permit(:name)
    end
end
