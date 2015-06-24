class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @match = User.find(params[:match_id])
    @languages = Language.all
  end

  def update
    current_user.update(bio: params[:user][:bio])
    languages.each do |id|
      UserLanguage.create(user_id: current_user.id, language_id: id)
    end
    redirect_to root_path
  end

  private

  def languages
    params[:user][:languages].shift
    params[:user][:languages]
  end

  def user_params
    params.require(:user).permit(:bio, {:language_ids => []})
  end
end
