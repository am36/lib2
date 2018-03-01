class Admin::UserController < ApplicationController
  def index
    @users = User.excluding_archived.order(:email)
  end
  
   def new
          @user = User.new
   end
   
  private
  def user_params
     params.require(:user).permit(:email, :password)
  end
   
end
