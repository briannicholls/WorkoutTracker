class CountersController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @counter = Counter.new
  end

  def create
    @counter = Counter.create counter_params
    if @counter.persisted?
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def counter_params
    params.require(:counter).permit(:title)
  end

  def set_counter
    Counter.find params[:id]
  end
end
