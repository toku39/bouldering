class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @problem = Problem.where(user_id: params[:id])

    # @problem = Problem.find(params[:id])
    # @problem = Problem.where(params[:id])
  end
end
