class Admin::UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User has been created."
            redirect_to admin_users_path
        else
            flash.now[:alert] = "User has not been created."
            render "new"
        end
    end
    
    def show
    end
    
    def edit
    end
    
   def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   end

    def destroy
        @user.destroy
        flash[:notice] = "User has been deleted."
        redirect_to admin_users_path
    end
    def index
        @users = User.all
    
        
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:email, :password)
    end

end
