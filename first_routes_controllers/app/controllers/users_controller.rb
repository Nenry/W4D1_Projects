class UsersController < ApplicationController
  
  def index 
    users = User.all
    render json: users
  end 
  
  def create 
      user = User.new(params.require(:user).permit(:name, :email))
      if user.save
        render json: user 
      else 
        render json: user.error.full_messages, status: 422
      end
  end
  
  
  
  def show
    user = User.find(params[:id])
    render json: user
  end
  
  
  def update
    user = User.find(params[:id])
    
    if user.update(user_params)
      render json: user
    else 
      render json: user.error.full_messages, status: 422
    end 
  end
  
  def destroy
    user = User.find(params[:id])
    
    user.destroy
    render plain: 'DESTROYED'
  end  
  private
  def user_params
    params.require(:user).permit(:name, :email, :age)
  end 
end 
