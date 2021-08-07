class ProblemsController < ApplicationController
  before_action :find_problem, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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
    @comment = Comment.new
    @comments = @problem.comments
  end

  def edit
  end

  def update
    if @problem.update(problem_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @problem.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:setter, :grade_id, :area, :memo, :user, :climb_done_id,
                                    :image).merge(user_id: current_user.id)
  end

  def find_problem
    @problem = Problem.find(params[:id])
  end
end
