class SessionController < ApplicationController

  layout false
  
  def login
    
  end

  def check_session
    if current_user.nil?
      redirect_to login_url
    else
      redirect_to experiences_url
    end
  end

  def authentificate
    email = authentification_params[:email]
    password = authentification_params[:password]

    user = User.authentificate(email,password)

    unless user.nil?
      session[:user_id] = user.id
      redirect_to experiences_url
    else

      redirect_to login_url, :alert => "El usuario o la contraseña no son correctos."
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_url
  end

  private #_________________________________Private:

  def authentification_params
    params.permit(:email, :password)
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
