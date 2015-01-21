class SessionController < ApplicationController

  def login
  end

  def authentificate
    email = authentification_params[:email]
    password = authentification_params[:password]

    user = User.authentificate(email,password)

    unless user.nil?
      session[:user_id] = user.id
      redirect_to experiences_url, :notice => "Logged in!"
    else
      redirect_to login_url,:notice => "NOT CORRECT"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_url, :notice => 'Sesión terminada correctamente'
  end
  

  private #_________________________________Private:

  def authentification_params
    params.permit(:email, :password)
  end


end
