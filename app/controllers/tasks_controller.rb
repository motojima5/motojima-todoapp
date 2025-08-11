class TasksController < ApplicationController
  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.board = Board.find(params[:board_id])
    if @task.save
      redirect_to board_path(@task.board), notice: "保存できたよ"
    else
      flash.now[:error] = "保存に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@task), notice: "更新できました"
    else
      flash.now[:error] = "更新できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(task.board), status: :see_other, notice: "削除に成功しました"
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :due_at, :eyecatch)
  end
end
