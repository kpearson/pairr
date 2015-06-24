class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(auth)
    if user
      session[:user_id] = user.id
      reject_self
      redirect_to root_path, notice: "Logged In"
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def reject_self
    Match.create(matcher_id: current_user, matchee_id: current_user, rejected: true)
  end

end
