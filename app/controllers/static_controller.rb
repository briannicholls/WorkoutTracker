class StaticController < ApplicationController
  def welcome
    #render :welcome
    redirect_to user_path(current_user) if logged_in?
  end

  def leaderboard
    #@users = User.all_by_grand_total()
    #@entries = Entry.all
    if params[:week]
      render 'static/leaderboard/week'
    elsif params[:day]
      render 'static/leaderboard/day'
    else
      render 'static/leaderboard/all-time'
    end
  end
end
