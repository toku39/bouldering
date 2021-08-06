class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, problem_id: params[:id])
    redirect_to problems_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, problem_id: params[:id]).destroy
    redirect_to problems_path
  end
end
