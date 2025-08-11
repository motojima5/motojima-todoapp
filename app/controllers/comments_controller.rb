class CommentsController < ApplicationController
  def new
    # board = Board.find(params[:board_id])
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.task = Task.find(params[:task_id])
    if @comment.save
      redirect_to board_task_path(@comment.task.board, @comment.task), notice: "コメントを追加"
    else
      flash.now[:error] = "更新できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
