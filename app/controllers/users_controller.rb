class UsersController < ApplicationController
  
  def show
    # users.show.htmlにuserのカラム情報、userのprototypeの情報のみが展開できるよう
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:user)
  end
end
