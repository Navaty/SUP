class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(comment_params)
    @comment.commenter = current_user.id
    redirect_to task_path(@task)
  end

  def destroy
    @comment.destroy
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
