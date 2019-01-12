class Admin::ContestantsController < AdminsController
  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = Contestant.new(contestant_params)
    if @contestant.save
      redirect_to admin_contestants_path
    else
      render :new
    end
  end

  private

    def contestant_params
      params.require(:contestant).permit(:name)
    end
end
