class CommentsController < ApplicationController
  def new
    # board = Board.find(params[:board_id])
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end
end
