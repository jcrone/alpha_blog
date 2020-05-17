class UsersController < ApplicationController

 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
   if @user.save
     flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signup"
     redirect_to articles_path
   else
     render 'new'
   end
 end

 def edit
   set_user
 end

def update
  set_user
  if @user.update(user_params)
    flash[:notice] = "#{@user.username} you updated successfully"
    redirect_to articles_path
  else
    render "edit"
  end
end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
  @user = User.find(params[:id])
  end

end
