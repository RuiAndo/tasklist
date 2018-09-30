class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = "登録しました"
      redirect_to @task
    else
      flash[:danger] = "登録できませんでした"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = "登録しました"
      redirect_to @task
    else
      flash[:danger] = "登録できませんでした"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = "削除しました"
    redirect_to tasks_path
  end


  private
  def task_params
    params.require(:task).permit(:content)
  end

end
