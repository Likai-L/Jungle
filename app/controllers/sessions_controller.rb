class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # user exists AND password is correct
    if user && user.authenticate(params[:password])
      # save the user id inside the browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else 
    # if user doesnt exist or password is incorrect
    redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end