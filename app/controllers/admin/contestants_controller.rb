class Admin::ContestantsController < AdminsController
  def new
    @contestant = Contestant.new
  end
end
