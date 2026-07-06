class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @goal = Goal.new
  end

  def edit
  end

  def update
    if @goal.update(goal_params) and @goal.habit_id == params[:habit_id].to_i
      redirect_to habit_goal_path(@goal.habit, @goal), notice: "Goal updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.habit_id = params[:habit_id]

    if @goal.save
      redirect_to habit_goal_path(@goal.habit, @goal), notice: "Goal created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_goal
    if @goal.habit_id == params[:habit_id].to_i
      @goal = Goal.find(params[:id])
    end
  end

  def goal_params
    params.require(:goal).permit(:title, :target_value, :current_value, :start_date, :end_date)
  end
end
