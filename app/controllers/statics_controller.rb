class StaticsController < ApplicationController
  before_action :set_variables

def experiences
  render :layout => 'layout_exp'
end

def mail
  #render :nothing => true
  nom = params[:nombre]
  corr = params[:correo]
  men = params[:mensaje]
  unless nom.empty? or corr.empty? or men.empty?
    ContactMailer.send_mail(nom,corr,men).deliver
  else
    render js: "alert('Por favor complete todos los campos.')"
    return
  end
  render plain: "aceptado"
end

private
  def set_variables
    @experiences = Experience.all
  end
end
