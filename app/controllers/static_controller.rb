class StaticController < ApplicationController
  def welcome
    #render :welcome
    redirect_to user_path(current_user) if logged_in?
  end

  def leaderboard
    #@users = User.all_by_grand_total()
    #@entries = Entry.all
  end
end
