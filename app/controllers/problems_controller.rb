class ProblemsController < ApplicationController
  
  def index
    @problem = Problem.order('created_at DESC')
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update(problem_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def problem_params
    params.require(:problem).permit(:setter, :grade_id, :area, :memo, :user, :climb_done_id, :image).merge(user_id: current_user.id)
  end
end
