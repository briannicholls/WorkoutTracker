class StaticController < ApplicationController
  def welcome
    #render :welcome
  end

  def leaderboard
    @users = User.all
  end
end
