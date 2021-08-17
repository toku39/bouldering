class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @problem = Problem.where(user_id: params[:id])
  end

  def new
  end
end
