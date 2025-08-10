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
