class GoalsController < ApplicationController
  before_action :set_habit
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = @habit.goals
  end

  def show
    @check_in = CheckIn.new
  end

  def new
    @goal = Goal.new
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to habit_goal_path(@goal.habit, @goal), notice: "Goal updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @goal  = @habit.goals.new(goal_params)

    if @goal.save
      redirect_to habit_goal_path(@goal.habit, @goal), notice: "Goal created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    redirect_to habit_path(@habit), notice: "Goal deleted."
  end

  private

  def set_goal
    @goal = @habit.goals.find(params[:id])
  end

  def set_habit
    @habit = Habit.find(params[:habit_id])
  end

  def goal_params
    params.require(:goal).permit(:title, :target_value, :current_value, :start_date, :end_date)
  end
end
