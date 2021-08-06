class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to problem_path(@comment.problem)
    else
      @problem = @comment.problem
      @comments = @problem.comments
      render "problems/show"
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, problem_id: params[:problem_id])
  end
end
