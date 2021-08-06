class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @problem = Problem.where(user_id: params[:id])

    # @problem = Problem.find(params[:id])
    # @problem = Problem.where(params[:id])
  end

  def liked_by?(problem_id)
    likes.where(problem_id: problem_id).exists?
  end
end
