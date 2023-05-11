class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.new(comment_params)
    @comment.save
    redirect_to room_task_path(@task.room_id, @task.id)
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    @comment.destroy
    redirect_to room_task_path(@task.room_id, @task.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, task_id: @task.id)
  end
end
