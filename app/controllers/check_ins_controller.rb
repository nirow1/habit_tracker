class CheckInsController < ApplicationController
  before_action :set_goal

  def create
    @check_in = @goal.check_ins.new(check_in_params)

    if @check_in.save
      redirect_to habit_goal_path(@goal.habit, @goal), notice: "Check-in created."
    else
      redirect_to habit_goal_path(@goal.habit, @goal), alert: @check_in.errors.full_messages.to_sentence
    end
  end
  
  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def check_in_params
    params.require(:check_in).permit(:date, :value, :note)
  end
end