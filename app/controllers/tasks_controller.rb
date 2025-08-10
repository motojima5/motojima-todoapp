class TasksController < ApplicationController
  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_path(@task), notice: "保存できたよ"
    else
      flash.now[:error] = "保存に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :due_at)
  end
end
