class MatchesController < ApplicationController
  before_action :authorize!

  def index
    @matches = ApplicationHelper.matches(current_user).concat( User.matchees_selected(User.matchers(current_user)) )
    @languages = Language.all
  end

  def new
    binding.pry
    @match = MATCHES.shuffle.pop
  end

  def update
    Match.create(matcher_id: current_user.id, matchee_id: params[:user_id], rejected: params[:reject])

    if params[:reject] == "false" && User.matchees_selected(User.matchers(current_user)).find(params[:user_id])
      redirect_to root_path, notice: "Your a match!!! Take a monent to email your new pair!"
    else
      redirect_to new_match_path
    end
  end
end
