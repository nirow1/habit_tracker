class HabitsController < ApplicationController
  before_action :set_habit, only: [:show, :edit, :update, :destroy]

  def index
    @habits = Habit.all
  end

  def show
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      redirect_to @habit, notice: "Habit created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @habit.update(habit_params)
      redirect_to @habit, notice: "Habit updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy
    redirect_to habits_path, notice: "Habit deleted."
  end

  private

  def set_habit
    @habit = Habit.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :description, :frequency_type, :active)
  end
end
