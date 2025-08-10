class TasksController < ApplicationController
  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
