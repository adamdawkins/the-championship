class Admin::ScoringsController < AdminsController
  before_action :set_task
  def create
    @task.scorings.create(scoring_params) 

    redirect_to admin_task_path(@task), notice: "Score added"
  end

  private
    def set_task
      @task = Task.find(params[:task_id])
    end

    def scoring_params
      params.require(:scoring).permit(:task_id, :scoreable_id, :scoreable_type, :amount)
    end
end
