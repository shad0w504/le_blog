class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      puts 'user created successfully'
    else
      puts user.errors.full_messages
    end
  end
  
  def show
    user = User.find(params[:id])
    
    render(json: Api::V1::UserSerializer.new(user).to_json)
  end
  
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end