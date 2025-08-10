class TasksController < ApplicationController
  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to task_path(board), notice: "タスクを追加"
    else
      flash.now[:error] = "更新できませんでした"
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
