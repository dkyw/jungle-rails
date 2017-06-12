class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:error] = "Email or password incorrect"
      render :new
    end
  end

    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to root_url, notice: "Logged in!"
    # else
    #   flash.now[:error] = "Email or password incorrect"
    #   render :new
    # end



  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end

end
