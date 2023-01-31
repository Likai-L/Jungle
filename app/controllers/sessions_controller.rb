class SessionsController < ApplicationController
  def new; end

  def create
    if (user = User.authenticate_with_credentials(params[:email], [:password]))
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
