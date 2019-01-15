class Admin::TasksController < AdminsController
  before_action :set_task, only: [:show, :start, :stop]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @scorings = Team.all.each.collect do |team|
      team.scorings.where(task_id: @task.id).first || @task.scorings.build(scoreable: team)
    end
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to admin_task_path(@task), notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def start
    @task.update(is_live: true)
    redirect_to admin_task_path(@task)
  end
  
  def stop
    @task.update(is_live: false, completed_at: Time.now)
    redirect_to admin_task_path(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description)
    end
end
