class LikesController < ApplicationController
  before_action :find_problem, only: [:create, :destroy]
  def create
    Like.create(user_id: current_user.id, problem_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, problem_id: params[:id]).destroy
  end

  def find_problem
    @problem = Problem.find(params[:id])
  end
end

